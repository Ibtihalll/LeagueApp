//
//  LeagueCellView.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//

import SwiftUI

struct LeagueCellView: View {
    @ObservedObject var viewModel: LeagueCellViewModel
    
    private var CurrentTeamView: some View {
        TeamView(viewModel: viewModel.makeTeamViewModel())
    }
    
    init(viewModel: LeagueCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationLink(destination: CurrentTeamView) {
            CustomAsyncImage(url: URL(string: self.viewModel.image))
                .frame(width: 110, height: 110)
        }
    }
}
