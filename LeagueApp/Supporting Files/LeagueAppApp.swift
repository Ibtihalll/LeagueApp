//
//  LeagueAppApp.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//
import SwiftUI

@main
struct LeagueAppApp: App {
    var body: some Scene {
        WindowGroup {
            let fetcher = LeagueFetcher()
            let viewModel = LeagueListViewModel(leagueFetcher: fetcher)
            LeagueView(viewModel: viewModel)
        }
    }
}
