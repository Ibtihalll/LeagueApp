//
//  TeamViewModelTests.swift
//  LeagueAppTests
//
//  Created by Devinsley on 18/01/2023.
//

import XCTest
@testable import LeagueApp

final class TeamViewModelTests: XCTestCase {
    
    private var model: TeamViewModel!
    
    override func setUp() {
        super.setUp()
        model = TeamViewModel(item: TeamListResponse.Item(idTeam: "133714", strTeam: "Paris SG", strTeamShort: "", strTeamBanner: "https://www.thesportsdb.com/images/media/team/banner/wvaw7l1641382901.jpg", strStadiumLocation: "Paris, France", strTeamBadge: "https://www.thesportsdb.com/images/media/team/badge/rwqrrq1473504808.png", strAlternate: "Paris Saint-Germain, PSG, Paris Saint Germain", strSport: "Soccer", strLeague: "French Ligue 1", idLeague: "4334", strDescriptionEN: "Paris Saint-Germain Football Club, commonly referred to as Paris Saint-Germain, Paris SG, or simply Paris or PSG, is a French professional football club based in Paris. Founded in 1970, the club has traditionally worn red, blue and white kits. PSG has played their home matches in the 47,929-capacity Parc des Princes, in the 16th arrondissement of Paris, since 1974.", strDescriptionFR: "Le Paris Saint-Germain Football Club (couramment abrégé en Paris SG ou PSG) est un club de football français basé à Paris, issu de la fusion en 1970 du Stade Saint-Germain, fondé en 1904"))
    }
    
    func testProperties() throws {
        
        XCTAssertEqual(self.model.teamName, "Paris SG")
        XCTAssertEqual(self.model.teamImage, "https://www.thesportsdb.com/images/media/team/banner/wvaw7l1641382901.jpg")
        XCTAssertEqual(self.model.teamCountry, "Paris, France")
        XCTAssertEqual(self.model.teamLeague, "French Ligue 1")
        XCTAssertEqual(self.model.teamDesc, "Le Paris Saint-Germain Football Club (couramment abrégé en Paris SG ou PSG) est un club de football français basé à Paris, issu de la fusion en 1970 du Stade Saint-Germain, fondé en 1904")
    }
}
