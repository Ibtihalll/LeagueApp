//
//  CustomAsyncImage.swift
//  LeagueApp
//
//  Created by Devinsley on 17/01/2023.
//

import SwiftUI

struct CustomAsyncImage: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(
            url: url,
            transaction: Transaction(animation: .spring())
        ) { phase in
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
    }
}
