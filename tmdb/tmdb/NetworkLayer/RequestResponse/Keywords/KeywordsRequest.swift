//
//  KeywordsRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 25/11/23.
//

import Foundation

class KeywordsRequest: BaseRequestProtocol {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var url: URL? {
        return ApiPaths.movieKeywords(movieID: id).url
    }
}
