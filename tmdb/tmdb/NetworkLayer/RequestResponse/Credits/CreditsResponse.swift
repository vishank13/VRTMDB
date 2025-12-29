//
//  CreditsResponse.swift
//  tmdb
//
//  Created by Vishank Raghav on 22/11/23.
//

import Foundation

struct CreditsResponse: Codable, Hashable {
    let id: Int?
    let cast: [Cast]?
    let crew: [Cast]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cast = "cast"
        case crew = "crew"
    }
    
    struct Cast: Codable, Hashable {
        let adult: Bool?
        let gender: Int?
        let id: Int?
        let knownForDepartment: Department?
        let name: String?
        let originalName: String?
        let popularity: Double?
        let profilePath: String?
        let castID: Int?
        let character: String?
        let creditID: String?
        let order: Int?
        let department: Department?
        let job: String?
        
        enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case gender = "gender"
            case id = "id"
            case knownForDepartment = "known_for_department"
            case name = "name"
            case originalName = "original_name"
            case popularity = "popularity"
            case profilePath = "profile_path"
            case castID = "cast_id"
            case character = "character"
            case creditID = "credit_id"
            case order = "order"
            case department = "department"
            case job = "job"
        }
        
        enum Department: String, Codable, Hashable {
            case acting = "Acting"
            case art = "Art"
            case camera = "Camera"
            case costumeMakeUp = "Costume & Make-Up"
            case crew = "Crew"
            case directing = "Directing"
            case editing = "Editing"
            case lighting = "Lighting"
            case production = "Production"
            case sound = "Sound"
            case visualEffects = "Visual Effects"
            case writing = "Writing"
            case none = "None"
        }
    }
}
