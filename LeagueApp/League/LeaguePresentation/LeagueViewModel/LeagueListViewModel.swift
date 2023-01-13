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
    
    init(
        leagueFetcher: LeagueFetchable,
        scheduler: DispatchQueue = DispatchQueue(label: "LeagueViewModel")
    ) {
        self.leagueFetcher = leagueFetcher
        $type
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchLeague(byType:))
            .store(in: &disposables)
    }
    
    func fetchLeague(byType type: String) {
        leagueFetcher.leagueListResponse(byType: type)
            .map { response in
                response.teams.map(LeagueCellViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.dataSource = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] data in
                    guard let self = self else { return }
                    self.dataSource = data
                })
            .store(in: &disposables)
    }
}
