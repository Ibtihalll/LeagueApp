//
//  TeamView.swift
//  LeagueApp
//
//  Created by Devinsley on 12/01/2023.
//

import SwiftUI
import Foundation

struct TeamView: View {
    
    @ObservedObject var viewModel: TeamViewModel
    
    init(viewModel: TeamViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(viewModel.teamName)
            .padding([.trailing, .leading])
            .font(Font.body.bold())
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, -30)
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    CustomAsyncImage(url: URL(string: self.viewModel.teamImage))
                    Text(viewModel.teamCountry)
                    Text(viewModel.teamLeague)
                        .font(Font.body.bold())
                    Text(viewModel.teamDesc)
                }
                .padding([.trailing, .leading])
                .padding(.bottom, 5)
            }
        }
    }
}
