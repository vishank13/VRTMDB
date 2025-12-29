//
//  TrendingPeopleResponse.swift
//  tmdb
//
//  Created by Vishank Raghav on 19/11/23.
//

import Foundation

struct TrendingPeopleResponse: Codable, Hashable {
    let page: Int?
    let results: [Result]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    // MARK: - Result
    struct Result: Codable, Hashable {
        let adult: Bool?
        let id: Int?
        let name: String?
        let originalName: String?
        let mediaType: String?
        let popularity: Double?
        let gender: Int?
        let knownForDepartment: KnownForDepartment?
        let profilePath: String?
        let knownFor: [KnownFor]?
        
        enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case id = "id"
            case name = "name"
            case originalName = "original_name"
            case mediaType = "media_type"
            case popularity = "popularity"
            case gender = "gender"
            case knownForDepartment = "known_for_department"
            case profilePath = "profile_path"
            case knownFor = "known_for"
        }
    }
    
    struct KnownFor: Codable, Hashable {
        let adult: Bool?
        let backdropPath: String?
        let id: Int?
        let title: String?
        let originalLanguage: String?
        let originalTitle: String?
        let overview: String?
        let posterPath: String?
        let mediaType: String?
        let genreIDS: [Int]?
        let popularity: Double?
        let releaseDate: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case backdropPath = "backdrop_path"
            case id = "id"
            case title = "title"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview = "overview"
            case posterPath = "poster_path"
            case mediaType = "media_type"
            case genreIDS = "genre_ids"
            case popularity = "popularity"
            case releaseDate = "release_date"
            case video = "video"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
    
    enum KnownForDepartment: String, Codable, Hashable {
        case acting = "Acting"
        case directing = "Directing"
        case writing = "Writing"
        case sound = "Sound"
        case none = ""
        
        var description: String {
            switch self {
            case .acting:
                return "Actor"
            case .directing:
                return "Director"
            case .none:
                return ""
            case .writing:
                return "Writer"
            case .sound:
                return "Sound"
            }
        }
    }

}
