//
//  TopRatedRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 27/11/23.
//

import Foundation

class TopRatedRequest: BaseRequestProtocol {
    
    init() {
    }
    
    var url: URL? {
        return ApiPaths.movieTopRated.url
    }
}
