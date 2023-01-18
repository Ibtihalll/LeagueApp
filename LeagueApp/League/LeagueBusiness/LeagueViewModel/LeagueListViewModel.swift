//
//  LeagueListViewModel.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//

import SwiftUI
import Combine

class LeagueListViewModel: ObservableObject, Identifiable {
    @Published var type: String = ""
    @Published var dataSource: [LeagueCellViewModel] = []
    
    private let leagueFetcher: LeagueFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(leagueFetcher: LeagueFetchable) {
        self.leagueFetcher = leagueFetcher
        self.fetchLeague()
        self.configureBindings()
    }
    
    func fetchLeague() {
        let scheduler: DispatchQueue = DispatchQueue(label: "LeagueViewModel")
        $type
            .dropFirst()
            .debounce(for: .seconds(0.7), scheduler: scheduler)
            .flatMap({ value in
                self.leagueFetcher.allLeaguesResponse()
            })
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion) in
            }, receiveValue: { (results) in
                guard let leagues = results.leagues else {
                    return
                }
                let value = leagues.filter { $0.strLeague.contains(self.type)}.first
                self.type = value?.strLeague ?? ""
            })
            .store(in: &disposables)
    }
    
    func configureBindings(){
        $type
            .dropFirst()
            .map({ value in
                self.leagueFetcher.leagueListResponse(byType: value)
            })
            .switchToLatest()
            .map { response -> [LeagueCellViewModel] in
                guard let teams = response.teams?.sorted(by: >) else {
                    return []
                }
                return teams.map(LeagueCellViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .assign(to: &$dataSource)
    }
}
