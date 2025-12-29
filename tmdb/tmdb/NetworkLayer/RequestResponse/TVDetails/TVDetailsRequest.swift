//
//  TVDetailsRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 17/12/23.
//

import Foundation

class TVDetailsRequest: BaseRequestProtocol {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var url: URL? {
        return ApiPaths.tvDetails(seriesID: id).url
    }
}
