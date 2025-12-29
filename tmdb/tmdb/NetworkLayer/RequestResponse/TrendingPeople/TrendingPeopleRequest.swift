//
//  TrendingPeopleRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 19/11/23.
//

import Foundation

class TrendingPeopleRequest: BaseRequestProtocol {
    
    var time: TiimeParameter
    
    init(time: TiimeParameter) {
        self.time = time
    }
    
    enum TiimeParameter: String {
        case day = "day"
        case week = "week"
    }
    
    var url: URL? {
        return ApiPaths.trendingPeople(time: time.rawValue).url
    }
}
