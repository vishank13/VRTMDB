//
//  TrendingContentRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import Foundation

class TrendingContentRequest: BaseRequestProtocol {
    
    var isMovie: Bool
    var time: TiimeParameter
    
    init(isMovie: Bool,
         time: TiimeParameter) {
        self.isMovie = isMovie
        self.time = time
    }
    
    enum TiimeParameter: String {
        case day = "day"
        case week = "week"
    }
    
    var url: URL? {
        return isMovie ? ApiPaths.trendingMovie(time: time.rawValue).url : ApiPaths.trendingTV(time: time.rawValue).url
    }

}
