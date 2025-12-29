//
//  MovieDetailsRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 19/11/23.
//

import Foundation

class MovieDetailsRequest: BaseRequestProtocol {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var url: URL? {
        return ApiPaths.movieDetails(movieID: id).url
    }
}
