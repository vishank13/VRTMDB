//
//  HomeView.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel: HomeViewModel
    @State var scrollID: Int?
    
    var body: some View {
        BaseStack {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    trendingContent
                    trendingPeople
                }
            }
        }
        .navigationTitle("TMDB")
        .navigationBarTitleDisplayMode(.large)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}, label: {
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                })
            }
        })
        .navigationDestination(for: TrendingContentDM.self) { item in
            if viewModel.showMovies {
                MovieDetailsView(viewModel: MovieDetailsViewModel(movieID: item.id))
            }
            
            if !viewModel.showMovies {
                TVDetailsView(viewModel: TVDetailsViewModel(seriesID: item.id))
            }
        }
    }
}

extension HomeView {
    
    var trendingContent: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(viewModel.showMovies ? "Trending Movies" : "Trending TV Shows")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomSwitchView(leftSelected: $viewModel.showMovies,
                                 leftTitle: "Movie",
                                 rightTitle: "TV") { _ in
                    viewModel.getTrendingContent()
                    withAnimation {
                        self.scrollID = viewModel.trendingContent.first?.id
                    }
                }
                                 .padding(.vertical)
                                 .padding(.trailing)
            }
            
            BaseHListView(scrollID: $scrollID,
                          data: viewModel.trendingContent,
                          id: \.id) { item in
                NavigationLink(value: item) {
                    PosterView(imageURL: item.imageURL,
                               title: item.posterTitle,
                               subTitle: item.posterSubTitle,
                               rating: item.voteAverage)
                }
            }
//            ScrollView(.horizontal) {
//                HStack(alignment: .top) {
//                    ForEach(viewModel.trendingContent) { item in
//                        NavigationLink(value: item) {
//                            PosterView(imageURL: item.imageURL,
//                                       title: item.posterTitle,
//                                       description: item.posterSubTitle,
//                                       rating: item.voteAverage)
//                        }
//                    }
//                }
//                .padding(.horizontal)
//            }
//            .scrollIndicators(.hidden)
        }
    }
    
    var trendingPeople: some View {
        VStack(spacing: 0) {
            Text("Trending People")
                .font(.title2)
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            BaseHListView(data: viewModel.trendingPeople,
                         id: \.id) { item in
                    PosterView(imageURL: item.imageURL,
                               title: item.personTitle,
                               subTitle: item.personSubTitle)
            }
//            ScrollView(.horizontal) {
//                HStack(alignment: .top) {
//                    ForEach(viewModel.trendingPeople) { item in
//                        PosterView(imageURL: item.imageURL,
//                                   title: item.personTitle,
//                                   description: item.personSubTitle)
//                    }
//                }
//                .padding(.horizontal)
//            }
//            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
