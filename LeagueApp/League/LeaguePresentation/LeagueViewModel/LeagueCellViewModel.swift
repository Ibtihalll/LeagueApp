//
//  LeagueCellViewModel.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//

import Foundation
import Combine
import SwiftUI

class LeagueCellViewModel: ObservableObject, Identifiable {
    
    @Published var dataSource: [TeamViewModel]?
    
//    private let leagueFetcher: LeagueFetchable
//    private var disposables = Set<AnyCancellable>()

    private let item: TeamListResponse.Item
    
    var id: String {
        return item.idTeam
    }
    
    var name: String {
        return item.strTeam ?? ""
    }
    
    var image: String {
        return item.strTeamBadge ?? ""
    }
    
    init(item: TeamListResponse.Item) {
        
//        self.leagueFetcher = leagueFetcher
        self.item = item
    }
}

extension LeagueCellViewModel: Hashable {
    static func == (lhs: LeagueCellViewModel, rhs: LeagueCellViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
//    func refresh() {
//        leagueFetcher
//            .teamDetailResponse(byName: name)
//            .map { response in
//                response.teams.map(TeamViewModel.init)
//            }
//        //        .map(Array.removeDuplicates)
//            .receive(on: DispatchQueue.main)
//            .sink(
//                receiveCompletion: { [weak self] value in
//                    guard let self = self else { return }
//                    switch value {
//                    case .failure:
//                        print("")
//                        self.dataSource = []
//                    case .finished:
//                        break
//                    }
//                },
//                receiveValue: { [weak self] data in
//                    guard let self = self else { return }
//                    self.dataSource = data
//                })
//            .store(in: &disposables)
//    }
}

extension LeagueCellViewModel {
    
    private func makeTeamView(
        byName name: String, item: TeamListResponse.Item) -> some View {
          let viewModel = TeamViewModel(item: item)
      return TeamView(viewModel: viewModel)
    }
    
    var currentTeamView: some View {
        return makeTeamView(
            byName: self.name, item: item)
    }
}
