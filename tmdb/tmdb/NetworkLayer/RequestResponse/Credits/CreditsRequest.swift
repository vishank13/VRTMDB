//
//  CreditsRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 22/11/23.
//

import Foundation

class CreditsRequest: BaseRequestProtocol {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var url: URL? {
        return ApiPaths.movieCredits(movieID: id).url
    }
}
