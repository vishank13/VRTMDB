//
//  TVDetailsDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 17/12/23.
//

import Foundation

struct TVDetailsDM: Identifiable, Hashable {
    let adult: Bool
    let backdropPath: String
    let createdBy: [TVDetailsResponse.CreatedBy]
    let episodeRunTime: [Int]
    let firstAirDate: String
    let genres: [TVDetailsResponse.Genre]
    let homepage: String
    let id: Int
    let inProduction: Bool
    let languages: [String]
    let lastAirDate: String
    let lastEpisodeToAir: TVDetailsResponse.LastEpisodeToAir
    let name: String
    let nextEpisodeToAir: TVDetailsResponse.LastEpisodeToAir
    let networks: [TVDetailsResponse.Network]
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [TVDetailsResponse.Network]
    let productionCountries: [TVDetailsResponse.ProductionCountry]
    let seasons: [TVDetailsResponse.Season]
    let spokenLanguages: [TVDetailsResponse.SpokenLanguage]
    let status: String
    let tagline: String
    let type: String
    let voteAverage: Double
    let voteCount: Int
 
    init(response: TVDetailsResponse? = nil) {
        self.adult = response?.adult ?? false
        self.backdropPath = response?.backdropPath ?? ""
        self.createdBy = response?.createdBy ?? []
        self.episodeRunTime = response?.episodeRunTime ?? [-1]
        self.firstAirDate = response?.firstAirDate ?? ""
        self.genres = response?.genres ?? []
        self.homepage = response?.homepage ?? ""
        self.id = response?.id ?? -1
        self.inProduction = response?.inProduction ?? false
        self.languages = response?.languages ?? []
        self.lastAirDate = response?.lastAirDate ?? ""
        self.lastEpisodeToAir = response?.lastEpisodeToAir ?? .init(id: -1,
                                                                   name: "",
                                                                   overview: "",
                                                                   voteAverage: 0.0,
                                                                   voteCount: -1,
                                                                   airDate: "",
                                                                   episodeNumber: -1,
                                                                   episodeType: "",
                                                                   productionCode: "",
                                                                   runtime: -1,
                                                                   seasonNumber: -1,
                                                                   showID: -1,
                                                                   stillPath: "")
        self.name = response?.name ?? ""
        self.nextEpisodeToAir = response?.nextEpisodeToAir ?? .init(id: -1,
                                                                    name: "",
                                                                    overview: "",
                                                                    voteAverage: 0.0,
                                                                    voteCount: -1,
                                                                    airDate: "",
                                                                    episodeNumber: -1,
                                                                    episodeType: "",
                                                                    productionCode: "",
                                                                    runtime: -1,
                                                                    seasonNumber: -1,
                                                                    showID: -1,
                                                                    stillPath: "")
        self.networks = response?.networks ?? []
        self.numberOfEpisodes = response?.numberOfEpisodes ?? -1
        self.numberOfSeasons = response?.numberOfSeasons ?? -1
        self.originCountry = response?.originCountry ?? []
        self.originalLanguage = response?.originalLanguage ?? ""
        self.originalName = response?.originalName ?? ""
        self.overview = response?.overview ?? ""
        self.popularity = response?.popularity ?? 0.0
        self.posterPath = response?.posterPath ?? ""
        self.productionCompanies = response?.productionCompanies ?? []
        self.productionCountries = response?.productionCountries ?? []
        self.seasons = response?.seasons ?? []
        self.spokenLanguages = response?.spokenLanguages ?? []
        self.status = response?.status ?? ""
        self.tagline = response?.tagline ?? ""
        self.type = response?.type ?? ""
        self.voteAverage = response?.voteAverage ?? 0.0
        self.voteCount = response?.voteCount ?? -1
    }
    
    var posterURL: String {
        return "\(ImageSize.posterSize)\(self.posterPath)"
    }
    
    var backdropURL: String {
        return "\(ImageSize.backdropSize)\(self.backdropPath)"
    }
}
