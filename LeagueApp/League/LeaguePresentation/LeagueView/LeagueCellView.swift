//
//  LeagueCellView.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//

import SwiftUI

struct LeagueCellView: View {
    
    @ObservedObject var viewModel: LeagueCellViewModel
    
    init(viewModel: LeagueCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationLink(destination: viewModel.currentTeamView) {
            AsyncImage(url: URL(string: self.viewModel.image), transaction: .init(animation: .spring())) { phase in
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
                    Text("unknown_label".localized())
                                    .foregroundColor(.gray)
                }
            }
//            .onAppear(perform: viewModel.refresh)
            .frame(width: 110, height: 110)
        }
    }
}
