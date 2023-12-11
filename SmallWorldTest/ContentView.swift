//
//  ContentView.swift
//  SmallWorldTest
//
//  Created by Sabih Haris on 10/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : MoviesViewModel
    
    var body: some View {
        NavigationView {
            List {
                listSection
            }
            
            .navigationTitle("Movies")
            .accessibilityShowsLargeContentViewer()
        }
    }
}

#Preview {
    ContentView(viewModel: MoviesViewModel(service: ContentService()))
}

extension ContentView {
    var listSection : some View {
        Section {
            ForEach(viewModel.moviesList) { item in
                MovieCellView(item: item)
                
            }
        }
    }
}
