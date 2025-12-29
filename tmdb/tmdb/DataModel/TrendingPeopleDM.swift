//
//  TrendingPeopleDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 19/11/23.
//

import Foundation

struct TrendingPeopleDM: Identifiable {
    let adult: Bool
    let id: Int
    let name: String
    let originalName: String
    let mediaType: String
    let popularity: Double
    let gender: Int
    let knownForDepartment: TrendingPeopleResponse.KnownForDepartment
    let profilePath: String
    let knownFor: [TrendingPeopleResponse.KnownFor]
    
    init(response: TrendingPeopleResponse.Result) {
        self.adult = response.adult ?? false
        self.id = response.id ?? -1
        self.name = response.name ?? ""
        self.originalName = response.originalName ?? ""
        self.mediaType = response.mediaType ?? ""
        self.popularity = response.popularity ?? -1.0
        self.gender = response.gender ?? -1
        self.knownForDepartment = response.knownForDepartment ?? .none
        self.profilePath = response.profilePath ?? ""
        self.knownFor = response.knownFor ?? []
    }
    
    var ID: String {
        return "\(self.id)"
    }
    
    var personTitle: String {
        return name
    }
    
    var personSubTitle: String {
        return knownForDepartment.description
    }
    
    var imageURL: String {
        return "\(ImageSize.profileSize)\(self.profilePath)"
    }
    
    
}
