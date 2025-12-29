//
//  TVDetailsResponse.swift
//  tmdb
//
//  Created by Vishank Raghav on 17/12/23.
//

import Foundation

struct TVDetailsResponse: Codable, Hashable {
    let adult: Bool?
    let backdropPath: String?
    let createdBy: [CreatedBy]?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: LastEpisodeToAir?
    let name: String?
    let nextEpisodeToAir: LastEpisodeToAir?
    let networks: [Network]?
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [Network]?
    let productionCountries: [ProductionCountry]?
    let seasons: [Season]?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let type: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case inProduction = "in_production"
        case languages = "languages"
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name = "name"
        case nextEpisodeToAir = "next_episode_to_air"
        case networks = "networks"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons = "seasons"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case type = "type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    struct CreatedBy: Codable, Hashable {
        let id: Int?
        let creditID: String?
        let name: String?
        let gender: Int?
        let profilePath: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case creditID = "credit_id"
            case name = "name"
            case gender = "gender"
            case profilePath = "profile_path"
        }
    }
    
    struct Genre: Codable, Hashable {
        let id: Int?
        let name: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }
    }
    
    struct LastEpisodeToAir: Codable, Hashable {
        let id: Int?
        let name: String?
        let overview: String?
        let voteAverage: Double?
        let voteCount: Int?
        let airDate: String?
        let episodeNumber: Int?
        let episodeType: String?
        let productionCode: String?
        let runtime: Int?
        let seasonNumber: Int?
        let showID: Int?
        let stillPath: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case overview = "overview"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case airDate = "air_date"
            case episodeNumber = "episode_number"
            case episodeType = "episode_type"
            case productionCode = "production_code"
            case runtime = "runtime"
            case seasonNumber = "season_number"
            case showID = "show_id"
            case stillPath = "still_path"
        }
    }
    
    struct Network: Codable, Hashable {
        let id: Int?
        let logoPath: String?
        let name: String?
        let originCountry: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case logoPath = "logo_path"
            case name = "name"
            case originCountry = "origin_country"
        }
    }
    
    struct ProductionCountry: Codable, Hashable {
        let iso3166_1: String?
        let name: String?
        
        enum CodingKeys: String, CodingKey {
            case iso3166_1 = "iso_3166_1"
            case name = "name"
        }
    }
    
    struct Season: Codable, Hashable {
        let airDate: String?
        let episodeCount: Int?
        let id: Int?
        let name: String?
        let overview: String?
        let posterPath: String?
        let seasonNumber: Int?
        let voteAverage: Double?
        
        enum CodingKeys: String, CodingKey {
            case airDate = "air_date"
            case episodeCount = "episode_count"
            case id = "id"
            case name = "name"
            case overview = "overview"
            case posterPath = "poster_path"
            case seasonNumber = "season_number"
            case voteAverage = "vote_average"
        }
    }
    
    struct SpokenLanguage: Codable, Hashable {
        let englishName: String?
        let iso639_1: String?
        let name: String?
        
        enum CodingKeys: String, CodingKey {
            case englishName = "english_name"
            case iso639_1 = "iso_639_1"
            case name = "name"
        }
    }
    
}
