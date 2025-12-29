//
//  MoviesView.swift
//  tmdb
//
//  Created by Vishank Raghav on 27/11/23.
//

import SwiftUI

struct MoviesView: View {
    
    @State var viewModel: MoviesViewModel
    
    var body: some View {
        BaseStack(showLoader: $viewModel.showLoader) {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    nowPlaying
                    popular
                    topRated
                    upcoming
                }
            }
        }
        .navigationTitle("Movies")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {ImageCache.shared.removeCache()}, label: {
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                })
            }
        }
        .navigationDestination(for: MoviesDM.self) { item in
            MovieDetailsView(viewModel: MovieDetailsViewModel(movieID: item.id))
        }
    }
}

extension MoviesView {
    
    var nowPlaying: some View {
        getMovieSection("Now Playing", viewModel.nowPlaying)
    }
    
    var popular: some View {
        getMovieSection("Popular", viewModel.popular)
    }
    
    var topRated: some View {
        getMovieSection("Top Rated", viewModel.topRated)
    }
    
    var upcoming: some View {
        getMovieSection("Upcoming", viewModel.upcoming)
    }
    
    fileprivate func getMovieSection(_ str: String,
                                     _ data: [MoviesDM]) -> some View {
        VStack(spacing: 0) {
            Text(str)
                .font(.title2)
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            BaseHListView(data: data,
                         id: \.id) { item in
                NavigationLink(value: item) {
                    PosterView(imageURL: item.imageURL,
                               title: item.posterTitle,
                               subTitle: item.posterSubTitle,
                               rating: item.voteAverage)
                }
            }
        }
    }
}

#Preview {
    MoviesView(viewModel: MoviesViewModel())
}
