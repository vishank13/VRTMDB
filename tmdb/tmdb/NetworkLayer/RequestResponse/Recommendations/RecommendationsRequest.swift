//
//  RecommendationsRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 26/11/23.
//

import Foundation

class RecommendationsRequest: BaseRequestProtocol {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var url: URL? {
        return ApiPaths.movieRecommendations(movieID: id).url
    }
}

