//
//  MovieImagesRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 01/12/23.
//

import Foundation

class MovieImagesRequest: BaseRequestProtocol {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var url: URL? {
        return ApiPaths.movieImages(movieID: id).url
    }
}

