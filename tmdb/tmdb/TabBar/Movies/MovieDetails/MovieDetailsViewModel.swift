//
//  MovieDetailsViewModel.swift
//  tmdb
//
//  Created by Vishank Raghav on 19/11/23.
//

import Foundation
import Observation

@Observable class MovieDetailsViewModel {
    
    var showLoader: Bool = false
    var movieID: Int
    var movieDetails: MovieDetailsDM = MovieDetailsDM()
    var movieCastCredits: [MovieCreditsDM] = []
    var movieCrewCredits: [MovieCreditsDM] = []
    var movieKeywords: [KeywordsDM] = []
    var movieRecommendations: [RecommendationsDM] = []
    var movieReviews: [ReviewsDM] = []
    var selectedReviews: ReviewsDM?
    var movieImagesBackdrop: [MovieImagesDM] = []
    var movieImagesLogo: [MovieImagesDM] = []
    var movieImagesPoster: [MovieImagesDM] = []
    var selectedMedia: [MovieImagesDM] = []
    
    init(movieID: Int) {
        self.movieID = movieID
        getMoviesData()
    }
    
    func getMoviesData() {
        showLoader = true
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getMovieDetails()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getMovieDetailsCredits()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getMovieKeywords()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getMovieRecommendations()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getMovieReviews()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getMovieImages()
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.showLoader = false
        }
    }
    
    // MARK: - API Calls
    private func getMovieDetails() {
        NetworkManager.shared.makeRequest(req: MovieDetailsRequest(id: movieID)) { (response: MovieDetailsResponse) in
            self.movieDetails = .init(response: response)
        }
    }
    
    private func getMovieDetailsCredits() {
        NetworkManager.shared.makeRequest(req: CreditsRequest(id: movieID)) { (response: CreditsResponse) in
            self.movieCastCredits = response.cast?.compactMap({ MovieCreditsDM.init(response: $0) }) ?? []
            self.movieCrewCredits = response.crew?.compactMap({ MovieCreditsDM.init(response: $0) }) ?? []
        }
    }
    
    private func getMovieKeywords() {
        NetworkManager.shared.makeRequest(req: KeywordsRequest(id: movieID)) { (response: KeywordsResponse) in
            self.movieKeywords = response.keywords?.compactMap({ KeywordsDM.init(response: $0) }) ?? []
        }
    }
    
    private func getMovieRecommendations() {
        NetworkManager.shared.makeRequest(req: RecommendationsRequest(id: movieID)) { (response: RecommendationsResponse) in
            self.movieRecommendations = response.results?.compactMap({ RecommendationsDM.init(response: $0) }) ?? []
        }
    }
    
    private func getMovieReviews() {
        NetworkManager.shared.makeRequest(req: ReviewsRequest(id: movieID)) { (response: ReviewsResponse) in
            self.movieReviews = response.results?.compactMap({ ReviewsDM.init(response: $0) }) ?? []
            self.selectedReviews = self.movieReviews.randomElement()
        }
    }
    
    private func getMovieImages() {
        NetworkManager.shared.makeRequest(req: MovieImagesRequest(id: movieID)) { (response: MovieImagesResponse) in
            self.handleMovieImagesResponse(response)
        }
    }
    
    // MARK: - Helper Methods
    func getGenreDisplayText() -> String {
        var combinedStr = ""
        
        for genre in movieDetails.genres {
            combinedStr.append("\(genre.name ?? "")")
            
            if movieDetails.genres.last != genre {
                combinedStr.append(", ")
            }
        }
        return combinedStr
    }
    
    func getMovieRuntimeText() -> String {
        return "\(Int(movieDetails.runtime/60))h \(Int(movieDetails.runtime%60))m"
    }
    
    func handleMovieImagesResponse(_ response: MovieImagesResponse) {
        self.movieImagesBackdrop = response.backdrops?.compactMap({
            MovieImagesDM(response: $0,
                          resolution: ImageSize.backdropSize)
        }) ?? []
        
        self.movieImagesLogo = response.logos?.compactMap({ MovieImagesDM(response: $0, resolution: ImageSize.logoSize) }) ?? []
        
        self.movieImagesPoster = response.posters?.compactMap({ MovieImagesDM(response: $0, resolution: ImageSize.posterSize) }) ?? []
        
        self.selectedMedia = self.movieImagesBackdrop
    }
    
    // MARK: - ViewModels
    func getCreditsViewModel() -> MovieCreditsViewModel {
        MovieCreditsViewModel(movieCastCredits: self.movieCastCredits,
                         movieCrewCredits: self.movieCrewCredits)
    }
}
