//
//  UpcomingRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 10/12/23.
//

import Foundation

class UpcomingRequest: BaseRequestProtocol {
    
    init() {
    }
    
    var url: URL? {
        return ApiPaths.movieUpcoming.url
    }
}
