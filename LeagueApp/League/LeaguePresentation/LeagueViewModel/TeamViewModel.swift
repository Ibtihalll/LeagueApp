//
//  TeamViewModel.swift
//  LeagueApp
//
//  Created by Devinsley on 12/01/2023.
//

import Combine

class TeamViewModel: ObservableObject, Identifiable {
    
    private let item: TeamListResponse.Item
    
    var teamName: String {
        return item.strTeam 
    }
    
    var teamImage: String {
        return item.strTeamBanner ?? ""
    }
    
    var teamCountry: String {
        return item.strStadiumLocation ?? ""
    }
    
    var teamLeague: String {
        return item.strLeague ?? ""
    }
    
    var teamDesc: String {
        return item.strDescriptionFR ?? (item.strDescriptionEN ?? "")
    }
    
    init(item: TeamListResponse.Item) {
        
      self.item = item
    }
}
