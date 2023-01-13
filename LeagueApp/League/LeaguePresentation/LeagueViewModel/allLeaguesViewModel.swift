//
//  allLeaguesViewModel.swift
//  LeagueApp
//
//  Created by Devinsley on 12/01/2023.
//

import Foundation

class allLeaguesViewModel: Identifiable {
    
    public let dataSource: AllLeaguesResponse.Item
    
    init(item: AllLeaguesResponse.Item) {
      self.dataSource = item
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
