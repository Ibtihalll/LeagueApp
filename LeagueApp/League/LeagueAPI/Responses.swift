//
//  Responses.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//


import Foundation

struct AllLeaguesResponse: Codable {
    let leagues: [Item]?
    
    struct Item: Codable {
        
        let idLeague: String?
        let strLeague: String
        let strSport: String?
        let strLeagueAlternate: String?
    }
}

struct TeamListResponse: Codable {
    let teams: [Item]?
    
    struct Item: Codable, Comparable {
        let idTeam : String
        let strTeam : String
        let strTeamShort : String?
        let strTeamBanner: String?
        let strStadiumLocation: String?
        let strTeamBadge: String?
        let strAlternate : String?
        let strSport : String?
        let strLeague : String?
        let idLeague: String?
        let strDescriptionEN: String?
        let strDescriptionFR: String?
        
        static func < (lhs: TeamListResponse.Item, rhs: TeamListResponse.Item) -> Bool {
            return lhs.strTeam < rhs.strTeam
        }
    }
}
