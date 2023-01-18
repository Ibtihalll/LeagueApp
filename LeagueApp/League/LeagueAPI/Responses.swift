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
        
        init(idTeam: String, strTeam: String, strTeamShort: String?, strTeamBanner: String?, strStadiumLocation: String?, strTeamBadge: String?, strAlternate: String?, strSport: String?, strLeague: String?, idLeague: String?, strDescriptionEN: String?, strDescriptionFR: String?) {
            self.idTeam = idTeam
            self.strTeam = strTeam
            self.strTeamShort = strTeamShort
            self.strTeamBanner = strTeamBanner
            self.strStadiumLocation = strStadiumLocation
            self.strTeamBadge = strTeamBadge
            self.strAlternate = strAlternate
            self.strSport = strSport
            self.strLeague = strLeague
            self.idLeague = idLeague
            self.strDescriptionEN = strDescriptionEN
            self.strDescriptionFR = strDescriptionFR
        }
        
        static func < (lhs: TeamListResponse.Item, rhs: TeamListResponse.Item) -> Bool {
            return lhs.strTeam < rhs.strTeam
        }
    }
}
