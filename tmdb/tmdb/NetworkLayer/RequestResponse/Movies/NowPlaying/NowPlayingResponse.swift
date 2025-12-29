//
//  NowPlayingResponse.swift
//  tmdb
//
//  Created by Vishank Raghav on 27/11/23.
//

import Foundation

struct NowPlayingResponse: Codable, Hashable {
    let dates: Dates?
    let page: Int?
    let results: [Result]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    struct Dates: Codable, Hashable {
        let maximum: String?
        let minimum: String?
        
        enum CodingKeys: String, CodingKey {
            case maximum = "maximum"
            case minimum = "minimum"
        }
    }
    
    struct Result: Codable, Hashable {
        let adult: Bool?
        let backdropPath: String?
        let genreIDS: [Int]?
        let id: Int?
        let originalLanguage: String?
        let originalTitle: String?
        let overview: String?
        let popularity: Double?
        let posterPath: String?
        let releaseDate: String?
        let title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case backdropPath = "backdrop_path"
            case genreIDS = "genre_ids"
            case id = "id"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview = "overview"
            case popularity = "popularity"
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title = "title"
            case video = "video"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
}
