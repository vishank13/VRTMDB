//
//  MovieCreditsDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 22/11/23.
//

import Foundation

struct MovieCreditsDM: Identifiable, Hashable {
    var uuid = UUID().uuidString
    let adult: Bool
    let castID: Int
    let character: String
    let creditID: String
    let department: CreditsResponse.Cast.Department
    let gender: Int
    let id: Int
    let job: String
    let knownForDepartment: CreditsResponse.Cast.Department
    let name: String
    let order: Int
    let originalName: String
    let popularity: Double
    let profilePath: String
    
    init(response: CreditsResponse.Cast? = nil) {
        self.adult = response?.adult ?? false
        self.gender = response?.gender ?? 0
        self.id = response?.id ?? -1
        self.knownForDepartment = response?.knownForDepartment ?? .none
        self.name = response?.name ?? ""
        self.originalName = response?.originalName ?? ""
        self.popularity = response?.popularity ?? 0.0
        self.profilePath = response?.profilePath ?? ""
        self.castID = response?.castID ?? -1
        self.character = response?.character ?? ""
        self.creditID = response?.creditID ?? ""
        self.order = response?.order ?? -1
        self.department = response?.department ?? .none
        self.job = response?.job ?? ""
    }
    
    var profileURL: String {
        return "\(ImageSize.profileSize)\(self.profilePath)"
    }
    
}
