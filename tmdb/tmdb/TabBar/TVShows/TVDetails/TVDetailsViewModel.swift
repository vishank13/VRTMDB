//
//  TVDetailsViewModel.swift
//  tmdb
//
//  Created by Vishank Raghav on 17/12/23.
//

import Foundation
import Observation

@Observable class TVDetailsViewModel {
    
    var showLoader: Bool = false
    var seriesID: Int
    var TVDetails: TVDetailsDM = TVDetailsDM()
//    var movieCastCredits: [MovieCreditsDM] = []
//    var movieCrewCredits: [MovieCreditsDM] = []
//    var movieKeywords: [KeywordsDM] = []
//    var movieRecommendations: [RecommendationsDM] = []
//    var movieReviews: [ReviewsDM] = []
//    var selectedReviews: ReviewsDM?
//    var movieImagesBackdrop: [MovieImagesDM] = []
//    var movieImagesLogo: [MovieImagesDM] = []
//    var movieImagesPoster: [MovieImagesDM] = []
//    var selectedMedia: [MovieImagesDM] = []
    
    init(seriesID: Int) {
        self.seriesID = seriesID
        getTVShowData()
    }
    
    func getTVShowData() {
        showLoader = true
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getTVDetails()
            dispatchGroup.leave()
        }
        
//        dispatchGroup.enter()
//        DispatchQueue.global().async {
//            self.getMovieDetailsCredits()
//            dispatchGroup.leave()
//        }
//        
//        dispatchGroup.enter()
//        DispatchQueue.global().async {
//            self.getMovieKeywords()
//            dispatchGroup.leave()
//        }
//        
//        dispatchGroup.enter()
//        DispatchQueue.global().async {
//            self.getMovieRecommendations()
//            dispatchGroup.leave()
//        }
//        
//        dispatchGroup.enter()
//        DispatchQueue.global().async {
//            self.getMovieReviews()
//            dispatchGroup.leave()
//        }
//        
//        dispatchGroup.enter()
//        DispatchQueue.global().async {
//            self.getMovieImages()
//            dispatchGroup.leave()
//        }
        
        dispatchGroup.notify(queue: .main) {
            self.showLoader = false
        }
    }
    
    // MARK: - API Calls
    private func getTVDetails() {
        NetworkManager.shared.makeRequest(req: TVDetailsRequest(id: seriesID)) { (response: TVDetailsResponse) in
            self.TVDetails = .init(response: response)
        }
    }
    
//    private func getMovieDetailsCredits() {
//        NetworkManager.shared.makeRequest(req: CreditsRequest(),
//                                          path: ApiPaths.movieCredits(movieID: movieID).path) { (response: CreditsResponse) in
//            self.movieCastCredits = response.cast?.compactMap({ MovieCreditsDM.init(response: $0) }) ?? []
//            self.movieCrewCredits = response.crew?.compactMap({ MovieCreditsDM.init(response: $0) }) ?? []
//        }
//    }
//    
//    private func getMovieKeywords() {
//        NetworkManager.shared.makeRequest(req: KeywordsRequest(),
//                                          path: ApiPaths.movieKeywords(movieID: movieID).path) { (response: KeywordsResponse) in
//            self.movieKeywords = response.keywords?.compactMap({ KeywordsDM.init(response: $0) }) ?? []
//        }
//    }
//    
//    private func getMovieRecommendations() {
//        NetworkManager.shared.makeRequest(req: RecommendationsRequest(),
//                                          path: ApiPaths.movieRecommendations(movieID: movieID).path) { (response: RecommendationsResponse) in
//            self.movieRecommendations = response.results?.compactMap({ RecommendationsDM.init(response: $0) }) ?? []
//        }
//    }
//    
//    private func getMovieReviews() {
//        NetworkManager.shared.makeRequest(req: ReviewsRequest(),
//                                          path: ApiPaths.movieReviews(movieID: movieID).path) { (response: ReviewsResponse) in
//            self.movieReviews = response.results?.compactMap({ ReviewsDM.init(response: $0) }) ?? []
//            self.selectedReviews = self.movieReviews.randomElement()
//        }
//    }
//    
//    private func getMovieImages() {
//        NetworkManager.shared.makeRequest(req: MovieImagesRequest(),
//                                          path: ApiPaths.movieImages(movieID: movieID).path) { (response: MovieImagesResponse) in
//            self.handleMovieImagesResponse(response)
//        }
//    }
//    
    // MARK: - Helper Methods
    func getGenreDisplayText() -> String {
        var combinedStr = ""
        
        for genre in TVDetails.genres {
            combinedStr.append("\(genre.name ?? "")")
            
            if TVDetails.genres.last != genre {
                combinedStr.append(", ")
            }
        }
        return combinedStr
    }
    
    func getShoweRuntimeText() -> String {
        guard let time = TVDetails.episodeRunTime.first else { return ""}
        return "\(Int(time/60))h \(Int(time%60))m"
    }
//    
//    func handleMovieImagesResponse(_ response: MovieImagesResponse) {
//        self.movieImagesBackdrop = response.backdrops?.compactMap({
//            MovieImagesDM(response: $0,
//                          resolution: ImageSize.backdropSize)
//        }) ?? []
//        
//        self.movieImagesLogo = response.logos?.compactMap({ MovieImagesDM(response: $0, resolution: ImageSize.logoSize) }) ?? []
//        
//        self.movieImagesPoster = response.posters?.compactMap({ MovieImagesDM(response: $0, resolution: ImageSize.posterSize) }) ?? []
//        
//        self.selectedMedia = self.movieImagesBackdrop
//    }
//    
//    // MARK: - ViewModels
//    func getCreditsViewModel() -> MovieCreditsViewModel {
//        CreditsViewModel(movieCastCredits: self.movieCastCredits,
//                         movieCrewCredits: self.movieCrewCredits)
//    }
}
