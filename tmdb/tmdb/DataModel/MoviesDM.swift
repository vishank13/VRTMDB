//
//  MoviesDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 27/11/23.
//

import Foundation

struct MoviesDM: Identifiable, Hashable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    init(response: NowPlayingResponse.Result? = nil) {
        self.adult = response?.adult ?? false
        self.backdropPath = response?.backdropPath ?? ""
        self.genreIDS = response?.genreIDS ?? []
        self.id = response?.id ?? -1
        self.originalLanguage = response?.originalLanguage ?? ""
        self.originalTitle = response?.originalTitle ?? ""
        self.overview = response?.overview ?? ""
        self.popularity = response?.popularity ?? 0.0
        self.posterPath = response?.posterPath ?? ""
        self.releaseDate = response?.releaseDate ?? ""
        self.title = response?.title ?? ""
        self.video = response?.video ?? false
        self.voteAverage = response?.voteAverage ?? 0.0
        self.voteCount = response?.voteCount ?? -1
    }
    
    init(response: PopularResponse.Result? = nil) {
        self.adult = response?.adult ?? false
        self.backdropPath = response?.backdropPath ?? ""
        self.genreIDS = response?.genreIDS ?? []
        self.id = response?.id ?? -1
        self.originalLanguage = response?.originalLanguage ?? ""
        self.originalTitle = response?.originalTitle ?? ""
        self.overview = response?.overview ?? ""
        self.popularity = response?.popularity ?? 0.0
        self.posterPath = response?.posterPath ?? ""
        self.releaseDate = response?.releaseDate ?? ""
        self.title = response?.title ?? ""
        self.video = response?.video ?? false
        self.voteAverage = response?.voteAverage ?? 0.0
        self.voteCount = response?.voteCount ?? -1
    }
    
    init(response: TopRatedResponse.Result? = nil) {
        self.adult = response?.adult ?? false
        self.backdropPath = response?.backdropPath ?? ""
        self.genreIDS = response?.genreIDS ?? []
        self.id = response?.id ?? -1
        self.originalLanguage = response?.originalLanguage ?? ""
        self.originalTitle = response?.originalTitle ?? ""
        self.overview = response?.overview ?? ""
        self.popularity = response?.popularity ?? 0.0
        self.posterPath = response?.posterPath ?? ""
        self.releaseDate = response?.releaseDate ?? ""
        self.title = response?.title ?? ""
        self.video = response?.video ?? false
        self.voteAverage = response?.voteAverage ?? 0.0
        self.voteCount = response?.voteCount ?? -1
    }
    
    init(response: UpcomingResponse.Result? = nil) {
        self.adult = response?.adult ?? false
        self.backdropPath = response?.backdropPath ?? ""
        self.genreIDS = response?.genreIDS ?? []
        self.id = response?.id ?? -1
        self.originalLanguage = response?.originalLanguage ?? ""
        self.originalTitle = response?.originalTitle ?? ""
        self.overview = response?.overview ?? ""
        self.popularity = response?.popularity ?? 0.0
        self.posterPath = response?.posterPath ?? ""
        self.releaseDate = response?.releaseDate ?? ""
        self.title = response?.title ?? ""
        self.video = response?.video ?? false
        self.voteAverage = response?.voteAverage ?? 0.0
        self.voteCount = response?.voteCount ?? -1
    }
    
    var posterTitle: String {
        return title
    }
    
    var posterSubTitle: String {
        return DateHelper.getDisplayDate(str: self.releaseDate)
    }
    
    var imageURL: String {
        return "\(ImageSize.posterSize)\(self.posterPath)"
    }
}
