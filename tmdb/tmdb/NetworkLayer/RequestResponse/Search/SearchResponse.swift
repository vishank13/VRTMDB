//
//  SearchResponse.swift
//  tmdb
//
//  Created by Vishank Raghav on 23/12/23.
//

import Foundation

struct SearchResponse: Codable, Hashable {
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
    
    struct Result: Codable, Hashable {
        let adult: Bool?
        let backdropPath: String?
        let id: Int?
        let name: String?
        let originalLanguage: String?
        let originalName: String?
        let overview: String?
        let posterPath: String?
        let mediaType: MediaType?
        let genreIDS: [Int]?
        let popularity: Double?
        let firstAirDate: String?
        let voteAverage: Double?
        let voteCount: Int?
        let originCountry: [String]?
        let title: String?
        let originalTitle: String?
        let releaseDate: String?
        let video: Bool?
        let gender: Int?
        let knownForDepartment: String?
        let profilePath: String?
        let knownFor: [KnownFor]?
        
        enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case backdropPath = "backdrop_path"
            case id = "id"
            case name = "name"
            case originalLanguage = "original_language"
            case originalName = "original_name"
            case overview = "overview"
            case posterPath = "poster_path"
            case mediaType = "media_type"
            case genreIDS = "genre_ids"
            case popularity = "popularity"
            case firstAirDate = "first_air_date"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case originCountry = "origin_country"
            case title = "title"
            case originalTitle = "original_title"
            case releaseDate = "release_date"
            case video = "video"
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
        let mediaType: MediaType?
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
    
//    enum MediaType: String, Codable, Hashable {
//        case movie = "movie"
//        case person = "person"
//        case tv = "tv"
//        case none = "none"
//    }
}
