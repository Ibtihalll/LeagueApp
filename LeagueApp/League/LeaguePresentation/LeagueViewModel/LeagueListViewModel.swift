//
//  LeagueListViewModel.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//

import SwiftUI
import Combine

class LeagueListViewModel: ObservableObject, Identifiable  {
    
    @Published var type: String = ""
    @Published var dataSource: [LeagueCellViewModel] = []
    
    private let leagueFetcher: LeagueFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(leagueFetcher: LeagueFetchable) {
        self.leagueFetcher = leagueFetcher
        self.configureBindings()
    }
    
    private func configureBindings(){
        $type
            .dropFirst()
            .print("type")
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
