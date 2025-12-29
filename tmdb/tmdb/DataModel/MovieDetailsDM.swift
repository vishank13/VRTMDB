//
//  MovieDetailsDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 22/11/23.
//

import Foundation

struct MovieDetailsDM: Identifiable, Hashable {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: MovieDetailsResponse.BelongsToCollection
    let budget: Int
    let genres: [MovieDetailsResponse.Genre]
    let homepage: String
    let id: Int
    let imdbID: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [MovieDetailsResponse.ProductionCompany]
    let productionCountries: [MovieDetailsResponse.ProductionCountry]
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [MovieDetailsResponse.SpokenLanguage]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
  
    init(response: MovieDetailsResponse? = nil) {
        self.adult = response?.adult ?? false
        self.backdropPath = response?.backdropPath ?? ""
        self.belongsToCollection = response?.belongsToCollection ?? .init(id: -1,
                                                                          name: "",
                                                                          posterPath: "",
                                                                          backdropPath: "")
        self.budget = response?.budget ?? -1
        self.genres = response?.genres ?? []
        self.homepage = response?.homepage ?? ""
        self.id = response?.id ?? -1
        self.imdbID = response?.imdbID ?? ""
        self.originalLanguage = response?.originalLanguage ?? ""
        self.originalTitle = response?.originalTitle ?? ""
        self.overview = response?.overview ?? ""
        self.popularity = response?.popularity ?? 0.0
        self.posterPath = response?.posterPath ?? ""
        self.productionCompanies = response?.productionCompanies ?? []
        self.productionCountries = response?.productionCountries ?? []
        self.releaseDate = response?.releaseDate ?? ""
        self.revenue = response?.revenue ?? -1
        self.runtime = response?.runtime ?? -1
        self.spokenLanguages = response?.spokenLanguages ?? []
        self.status = response?.status ?? ""
        self.tagline = response?.tagline ?? ""
        self.title = response?.title ?? ""
        self.video = response?.video ?? false
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
