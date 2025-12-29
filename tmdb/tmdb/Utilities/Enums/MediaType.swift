//
//  MediaType.swift
//  tmdb
//
//  Created by Vishank Raghav on 31/12/23.
//

import Foundation

enum MediaType: String, Codable, Hashable {
    case movie = "movie"
    case person = "person"
    case tv = "tv"
    case none = "none"
}
