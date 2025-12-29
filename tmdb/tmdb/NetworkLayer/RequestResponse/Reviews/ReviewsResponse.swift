//
//  ReviewsResponse.swift
//  tmdb
//
//  Created by Vishank Raghav on 26/11/23.
//

import Foundation

struct ReviewsResponse: Codable, Hashable {
    let id: Int?
    let page: Int?
    let results: [Result]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    struct Result: Codable, Hashable {
        let author: String?
        let authorDetails: AuthorDetails?
        let content: String?
        let createdAt: String?
        let id: String?
        let updatedAt: String?
        let url: String?
        
        enum CodingKeys: String, CodingKey {
            case author = "author"
            case authorDetails = "author_details"
            case content = "content"
            case createdAt = "created_at"
            case id = "id"
            case updatedAt = "updated_at"
            case url = "url"
        }
    }
    
    struct AuthorDetails: Codable, Hashable {
        let name: String?
        let username: String?
        let avatarPath: String?
        let rating: Int?
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case username = "username"
            case avatarPath = "avatar_path"
            case rating = "rating"
        }
    }
}
