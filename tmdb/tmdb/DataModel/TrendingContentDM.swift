//
//  TrendingContentDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import Foundation

struct TrendingContentDM: Identifiable, Hashable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name: String
    let originalLanguage: String
    let originalName: String
    let overview: String
    let posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]
    let title: String
    let originalTitle: String
    let releaseDate: String
    let video: Bool
    
    init(response: TrendingContentResponse.Result) {
        self.adult = response.adult ?? false
        self.backdropPath = response.backdropPath ?? ""
        self.id = response.id ?? -1
        self.name = response.name ?? ""
        self.originalLanguage = response.originalLanguage ?? ""
        self.originalName = response.originalName ?? ""
        self.overview = response.overview ?? ""
        self.posterPath = response.posterPath ?? ""
        self.mediaType = response.mediaType ?? .none
        self.genreIDS = response.genreIDS ?? []
        self.popularity = response.popularity ?? -1.0
        self.firstAirDate = response.firstAirDate ?? ""
        self.voteAverage = response.voteAverage ?? -1.0
        self.voteCount = response.voteCount ?? -1
        self.originCountry = response.originCountry ?? []
        self.title = response.title ?? ""
        self.originalTitle = response.originalTitle ?? ""
        self.releaseDate = response.releaseDate  ?? ""
        self.video = response.video ?? false
    }
    
    var posterTitle: String {
        switch mediaType {
        case .movie:
            return title
        case .tv:
            return name
        case .none:
            return ""
        default:
            return ""
        }
    }
    
    var posterSubTitle: String {
        switch mediaType {
        case .movie:
            return DateHelper.getDisplayDate(str: self.releaseDate)
        case .tv:
            return DateHelper.getDisplayDate(str: self.firstAirDate)
        case .none:
            return ""
        default:
            return ""
        }
    }
    
    var imageURL: String {
        return "\(ImageSize.posterSize)\(self.posterPath)"
    }
    
    
}
