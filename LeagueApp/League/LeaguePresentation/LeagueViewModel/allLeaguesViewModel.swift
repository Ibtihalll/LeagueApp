//
//  allLeaguesViewModel.swift
//  LeagueApp
//
//  Created by Devinsley on 12/01/2023.
//

import Foundation

class allLeaguesViewModel: ObservableObject, Identifiable {
    
    private let item: AllLeaguesResponse.Item
    
    var name: String {
        return item.strLeague 
    }
    
    init(item: AllLeaguesResponse.Item) {
        self.item = item
    }
}

extension allLeaguesViewModel: Hashable {
    static func == (lhs: allLeaguesViewModel, rhs: allLeaguesViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
