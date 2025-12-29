//
//  SearchDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 24/12/23.
//

import Foundation

struct SearchDM: Identifiable, Hashable {
    var adult: Bool
    var backdropPath: String
    var id: Int
    var name: String
    var originalLanguage: String
    var originalName: String
    var overview: String
    var posterPath: String
    var mediaType: MediaType
    var genreIDS: [Int]
    var popularity: Double
    var firstAirDate: String
    var voteAverage: Double
    var voteCount: Int
    var originCountry: [String]
    var title: String
    var originalTitle: String
    var releaseDate: String
    var video: Bool
    var gender: Int
    var knownForDepartment: String
    var profilePath: String
    var knownFor: [SearchResponse.KnownFor]
    
    init(response: SearchResponse.Result? = nil) {
        self.adult = response?.adult ?? false
        self.backdropPath = response?.backdropPath ?? ""
        self.id = response?.id ?? -1
        self.name = response?.name ?? ""
        self.originalLanguage = response?.originalLanguage ?? ""
        self.originalName = response?.originalName ?? ""
        self.overview = response?.overview ?? ""
        self.posterPath = response?.posterPath ?? ""
        self.mediaType = response?.mediaType ?? MediaType.none
        self.genreIDS = response?.genreIDS ?? []
        self.popularity = response?.popularity ?? 0.0
        self.firstAirDate = response?.firstAirDate ?? ""
        self.voteAverage = response?.voteAverage ?? 0.0
        self.voteCount = response?.voteCount ?? -1
        self.originCountry = response?.originCountry ?? []
        self.title = response?.title ?? ""
        self.originalTitle = response?.originalTitle ?? ""
        self.releaseDate = response?.releaseDate ?? ""
        self.video = response?.video ?? false
        self.gender = response?.gender ?? -1
        self.knownForDepartment = response?.knownForDepartment ?? ""
        self.profilePath = response?.profilePath ?? ""
        self.knownFor = response?.knownFor ?? []
    }
    
    var displayTitle: String {
        switch mediaType {
        case .movie:
            title
        case .person:
            name
        case .tv:
            name
        case .none:
            "--"
        }
    }
    
    var imageURL: String {
        switch mediaType {
        case .movie, .tv:
            "\(ImageSize.posterSize)\(self.posterPath)"
        case .person:
            "\(ImageSize.profileSize)\(self.profilePath)"
        case .none:
            ""
        }
    }
    
    var description: String {
        switch mediaType {
        case .movie, .tv:
            overview
        case .person:
            knownForDepartment
        case .none:
            ""
        }
    }
}
