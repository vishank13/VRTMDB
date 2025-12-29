//
//  RecommendationsDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 26/11/23.
//

import Foundation

struct RecommendationsDM: Identifiable, Hashable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let mediaType: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    init(response: RecommendationsResponse.Result? = nil) {
        self.adult = response?.adult ?? false
        self.backdropPath = response?.backdropPath ?? ""
        self.id = response?.id ?? -1
        self.title = response?.title ?? ""
        self.originalLanguage = response?.originalLanguage ?? ""
        self.originalTitle = response?.originalTitle ?? ""
        self.overview = response?.overview ?? ""
        self.posterPath = response?.posterPath ?? ""
        self.mediaType = response?.mediaType ?? ""
        self.genreIDS = response?.genreIDS ?? []
        self.popularity = response?.popularity ?? 0.0
        self.releaseDate = response?.releaseDate ?? ""
        self.video = response?.video ?? false
        self.voteAverage = response?.voteAverage ?? 0.0
        self.voteCount = response?.voteCount ?? -1
    }
    
    var backdropURL: String {
        return "\(ImageSize.backdropSize)\(self.backdropPath)"
    }
}
