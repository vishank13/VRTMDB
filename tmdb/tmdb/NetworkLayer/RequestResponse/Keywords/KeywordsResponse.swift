//
//  KeywordsResponse.swift
//  tmdb
//
//  Created by Vishank Raghav on 25/11/23.
//

import Foundation

struct KeywordsResponse: Codable, Hashable {
    let id: Int?
    let keywords: [Keyword]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case keywords = "keywords"
    }

    struct Keyword: Codable, Hashable {
        let id: Int?
        let name: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }
    }
}
