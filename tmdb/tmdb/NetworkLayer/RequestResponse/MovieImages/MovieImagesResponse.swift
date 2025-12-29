//
//  MovieImagesResponse.swift
//  tmdb
//
//  Created by Vishank Raghav on 01/12/23.
//

import Foundation

struct MovieImagesResponse: Codable, Hashable {
    let backdrops: [Resource]?
    let id: Int?
    let logos: [Resource]?
    let posters: [Resource]?
    
    enum CodingKeys: String, CodingKey {
        case backdrops = "backdrops"
        case id = "id"
        case logos = "logos"
        case posters = "posters"
    }
    
    struct Resource: Codable, Hashable {
        let aspectRatio: Double?
        let height: Int?
        let iso639_1: String?
        let filePath: String?
        let voteAverage: Double?
        let voteCount: Int?
        let width: Int?
        
        enum CodingKeys: String, CodingKey {
            case aspectRatio = "aspect_ratio"
            case height = "height"
            case iso639_1 = "iso_639_1"
            case filePath = "file_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case width = "width"
        }
    }
}
