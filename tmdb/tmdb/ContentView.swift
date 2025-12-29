//
//  ContentView.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let _ = ImageSize(posterSize: ImageSize.Poster.w154,
                          backdropSize: ImageSize.Backdrop.w780,
                          profileSize: ImageSize.profile.w185,
                          logoSize: ImageSize.Logo.w92)
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView(viewModel: HomeViewModel())
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            NavigationStack {
                MoviesView(viewModel: MoviesViewModel())
            }
            .tabItem {
                Label("Movies", systemImage: "movieclapper.fill")
            }
            
            NavigationStack {
                TVShowsView()
            }
            .tabItem {
                Label("TV Shows", systemImage: "tv.fill")
            }
            
            NavigationStack {
                SearchView(viewModel: SearchViewModel())
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
}

#Preview {
    ContentView()
}
