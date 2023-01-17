//
//  LeagueView.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//

import SwiftUI

struct LeagueView: View {
    
    @ObservedObject var viewModel: LeagueListViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            List{
                searchField
                if viewModel.dataSource.isEmpty {
                    Text("no_records_label".localized())
                        .listRowBackground(EmptyView())
                } else {
                    forecastSection
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}

private extension LeagueView {
    var searchField: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("", text: $viewModel.type, prompt: Text("search_bar_label".localized()))
        }
        .padding(EdgeInsets(top: 8, leading: 3, bottom: 8, trailing: 3))
        .foregroundColor(.primary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12.0)
    }
    
    var forecastSection: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.dataSource, content: LeagueCellView.init(viewModel:))
            }
            .padding(.horizontal)
        }
    }
}
