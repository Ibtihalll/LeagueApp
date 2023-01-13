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
                AsyncImage(url: URL(string: viewModel.teamImage), transaction: .init(animation: .spring())) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .transition(.opacity.combined(with: .scale))
                    case .failure(_):
                        VStack(spacing: 16) {
                                        Image(systemName: "xmark.octagon.fill")
                                            .foregroundColor(.red)
                                    }
                    @unknown default:
                        Text("no_records_label".localized())
                                        .foregroundColor(.gray)
                    }
                }
                .padding([.trailing, .leading])
                    .padding(.bottom, 5)
                
                Text(viewModel.teamCountry)
                    .padding([.trailing, .leading])
                    .padding(.bottom, 5)
                Text(viewModel.teamLeague)
                    .padding([.trailing, .leading])
                    .padding(.bottom, 5)
                    .font(Font.body.bold())
                Text(viewModel.teamDesc)
                    .padding([.trailing, .leading])
                    .padding(.bottom, 5)
            }
        }
    }
}
