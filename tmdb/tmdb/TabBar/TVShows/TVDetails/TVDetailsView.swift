//
//  TVDetailsView.swift
//  tmdb
//
//  Created by Vishank Raghav on 17/12/23.
//

import SwiftUI

struct TVDetailsView: View {

    @State var viewModel: TVDetailsViewModel

    var body: some View {
        BaseStack(showLoader: $viewModel.showLoader) {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    headerView
                    genreView
                    titleView
                    description
                }
            }
        }
        .navBar()
        .toolbar(.hidden, for: .tabBar)
    }
}

extension TVDetailsView {
    var headerView: some View {
        ZStack(alignment: .leading) {
            backdropView
            HStack(spacing: 0) {
                posterView
                subInfoView
            }
        }
        .clipped()
    }
    
    var backdropView: some View {
        AsyncCachedImage(url: viewModel.TVDetails.backdropURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure(_):
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .onAppear {
                        print("FAILED::::::::::\(viewModel.TVDetails.backdropURL)")
                    }
            @unknown default:
                ProgressView()
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
        .frame(height: 300)
        .clipped()
        .background {
            Color.gray
        }
        .overlay {
            Color.black.opacity(0.5)
        }
    }
    
    var posterView: some View {
        AsyncCachedImage(url: viewModel.TVDetails.posterURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
            case .failure(_):
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            @unknown default:
                ProgressView()
            }
        }
        .frame(width: 150, height: 225)
        .background {
            Color.gray
        }
        .shadow(color: .black, radius: 50)
        .padding(15)
    }
    
    var subInfoView: some View {
        VStack(alignment: .center) {
            HStack {
                RatingsView(rating: viewModel.TVDetails.voteAverage,
                            size: 60.0)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 2, height: 50)
                    .foregroundStyle(Color.secondary.opacity(0.9))
                
                Text("User Rating")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
            }
            
            VStack(alignment: .center, spacing: 10.0) {
                Text("Release Date: ").fontWeight(.heavy) + Text(DateHelper.getDisplayDate(str: viewModel.TVDetails.firstAirDate))
                
                Text("Genre: ").fontWeight(.heavy) + Text(viewModel.getGenreDisplayText())
                
                Text("Duration: ").fontWeight(.heavy) + Text(viewModel.getShoweRuntimeText())
            }
            .font(.subheadline)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal)
    }
    
    var genreView: some View {
        FlexibleView(data: viewModel.TVDetails.genres,
                     spacing: 5,
                     alignment: .center) { item in
            Text(verbatim: item.name ?? "-")
                .font(.footnote)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                )
        }
                     .padding(.horizontal)
    }
    
    var titleView: some View {
        titleView(viewModel.TVDetails.name)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
    }
    
    var description: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(viewModel.TVDetails.tagline)
                .font(.body)
                .multilineTextAlignment(.leading)
                .italic()
                .foregroundStyle(.secondary)
            
            Text("Overview")
                .font(.title3)
                .fontWeight(.bold)
            
            Text(viewModel.TVDetails.overview)
                .font(.body)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
    }
    
    func titleView(_ title: String) -> some View {
        Text(title)
            .font(.title2)
            .fontWeight(.heavy)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
/*
struct MovieDetailsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel: MovieDetailsViewModel
    @State var showReview: Bool = false
    @State var showBackdrop: Bool = true
    @State var showPoster: Bool = false
    @State var scrollID: UUID?
    @State var imageWidth: CGFloat = 350
    
    var body: some View {
        BaseStack(showLoader: $viewModel.showLoader) {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    headerView
                    titleView
                    description
                    HDividerView()
                    otherDetails
                    HDividerView()
                    creditsView
                    HDividerView()
                    if !viewModel.movieRecommendations.isEmpty {
                        recommendationsView
                        HDividerView()
                    }
                    if !viewModel.movieReviews.isEmpty {
                        reviewView
                        HDividerView()
                    }
                    imagesView
                    HDividerView()
                    keywordsView
                    
                    Spacer(minLength: 0)
                }
            }
        }
        .sheet(isPresented: $showReview) {
            reviewSheetView
                .presentationDetents([.medium, .fraction(0.99)])
        }
        .navBar()
        .toolbar(.hidden, for: .tabBar)
    }
}

extension MovieDetailsView {
    
    var otherDetails: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading) {
                    Text("Budget")
                        .fontWeight(.bold)
                    
                    Text(viewModel.movieDetails.budget.formatted(.currency(code: "USD")))
                }
                
                VStack(alignment: .leading) {
                    Text("Revenue")
                        .fontWeight(.bold)
                    
                    Text(viewModel.movieDetails.revenue.formatted(.currency(code: "USD")))
                }
            }
            Spacer()
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading) {
                    Text("Status")
                        .fontWeight(.bold)
                    
                    Text(viewModel.movieDetails.status)
                }
                
                VStack(alignment: .leading) {
                    Text("Original Language")
                        .fontWeight(.bold)
                    
                    Text(viewModel.movieDetails.originalLanguage)
                }
            }
        }
        .font(.callout)
        .padding(.horizontal)
    }
    
    var creditsView: some View {
        MovieCreditsHListView(credits: viewModel.movieCastCredits,
                         viewModel: viewModel.getCreditsViewModel())
    }
    
    var recommendationsView: some View {
        VStack {
            titleView("Recommendations")
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(viewModel.movieRecommendations) { movie in
                        NavigationLink {
                            MovieDetailsView(viewModel: .init(movieID: movie.id))
                        } label: {
                            MediaCardView(recommendedItem: movie)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(.horizontal, 15.0, for: .scrollContent)
            .contentMargins(.bottom, 15.0, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
    }
    
    @ViewBuilder
    var reviewView: some View {
        if let review = viewModel.selectedReviews {
            VStack {
                titleView("Review")
                
                ReviewDetailsView(review: review,
                                  isLineLimitEnabled: true,
                                  isDividerVisible: false) {
                    self.showReview.toggle()
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    var imagesView: some View {
        VStack {
            titleView("Media")
            
            HStack {
                Text("Backdrop")
                    .font(.callout)
                    .fontWeight(showBackdrop ? .bold : .regular)
                    .underline(self.showBackdrop, color: Color.black)
                    .onTapGesture {
                            self.showBackdrop = true
                            self.showPoster = false
                            self.viewModel.selectedMedia = viewModel.movieImagesBackdrop
                        withAnimation {
                            self.scrollID = self.viewModel.selectedMedia.first?.id
                        }
                        imageWidth = 350
                    }
                    .frame(maxWidth: .infinity)
                
                Text("Poster")
                    .font(.callout)
                    .fontWeight(showPoster ? .bold : .regular)
                    .underline(self.showPoster, color: Color.black)
                    .onTapGesture {
                        self.showBackdrop = false
                        self.showPoster = true
                        self.viewModel.selectedMedia = viewModel.movieImagesPoster
                        withAnimation {
                            self.scrollID = self.viewModel.selectedMedia.first?.id
                        }
                        imageWidth = 150
                    }
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(viewModel.selectedMedia) { movie in
                        NavigationLink {
                            ImageViewer(image: movie.imageURLOriginal)
                        } label: {
                            CachedImageVew(url: movie.imageURL)
                                .scaledToFill()
                                .frame(width: imageWidth)
                                .aspectRatio(movie.aspectRatio, contentMode: .fit)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrollID)
            . contentMargins(.horizontal, 15.0, for: .scrollContent)
            . contentMargins(.bottom, 15.0, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding(.horizontal)
    }
    
    var keywordsView: some View {
        VStack {
            titleView("Keywords")
            
            FlexibleView(data: viewModel.movieKeywords,
                         spacing: 5,
                         alignment: .leading) { item in
                Text(verbatim: item.name)
                    .font(.footnote)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.2))
                    )
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    var reviewSheetView: some View {
        if let review = viewModel.selectedReviews {
            VStack {
                ReviewDetailsView(review: review)
                Spacer()
            }
            .padding(.top, 30)
            .padding(.horizontal)
        }
    }
}
*/
#Preview {
    TVDetailsView(viewModel: TVDetailsViewModel(seriesID: 84958))
}
