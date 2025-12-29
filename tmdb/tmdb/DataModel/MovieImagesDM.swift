//
//  MovieImagesDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 01/12/23.
//

import Foundation

struct MovieImagesDM: Identifiable, Hashable {
    let id = UUID()
    let aspectRatio: Double
    let height: Int
    let iso639_1: String
    let filePath: String
    let voteAverage: Double
    let voteCount: Int
    let width: Int
    let resolution: String
    
    init(response: MovieImagesResponse.Resource? = nil,
         resolution: String) {
        self.aspectRatio = response?.aspectRatio ?? 0.0
        self.height = response?.height ?? 0
        self.iso639_1 = response?.iso639_1 ?? ""
        self.filePath = response?.filePath ?? ""
        self.voteAverage = response?.voteAverage ?? 0.0
        self.voteCount = response?.voteCount ?? -1
        self.width = response?.width ?? 0
        self.resolution = resolution
    }
    
    var imageURL: String {
        return "\(self.resolution)\(self.filePath)"
    }
    
    var imageURLOriginal: String {
        return "\(ImageSize.Poster.original.rawValue)\(self.filePath)"
    }
}
