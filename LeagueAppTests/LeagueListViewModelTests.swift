//
//  LeagueListViewModelTests.swift
//  LeagueAppTests
//
//  Created by Devinsley on 17/01/2023.
//

import XCTest
import Combine
@testable import LeagueApp

final class LeagueListViewModelTests: XCTestCase {
    private var model: LeagueListViewModel!
    
    override func setUp() {
        super.setUp()
        let fetcher = LeagueFetcher()
        self.model = LeagueListViewModel(leagueFetcher: fetcher)
    }
    
    func testconfigureBindings() async throws {
        self.model.type = "French ligue 1"
        self.model.configureBindings()
        self.model.dataSource.forEach{ value in
            XCTAssertEqual(value.name, self.model.type)
        }
    }
}
