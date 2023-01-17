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
    
    private let item: TeamListResponse.Item
    
    var id: String {
        return item.idTeam
    }
    
    var name: String {
        return item.strTeam 
    }
    
    var image: String {
        return item.strTeamBadge ?? ""
    }
    
    init(item: TeamListResponse.Item) {
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
}

extension LeagueCellViewModel {
    func makeTeamViewModel() -> TeamViewModel {
        let viewModel = TeamViewModel(item: item)
        return viewModel
    }
}
