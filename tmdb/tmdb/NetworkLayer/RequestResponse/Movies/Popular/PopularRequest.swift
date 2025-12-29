//
//  PopularRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 27/11/23.
//

import Foundation

class PopularRequest: BaseRequestProtocol {
    
    init() {
    }
    
    var url: URL? {
        return ApiPaths.moviePopular.url
    }
}
