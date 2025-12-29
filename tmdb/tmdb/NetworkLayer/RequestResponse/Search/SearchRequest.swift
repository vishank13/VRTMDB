//
//  SearchRequest.swift
//  tmdb
//
//  Created by Vishank Raghav on 23/12/23.
//

import Foundation

//let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/search/multi?query=loki&include_adult=true&language=en-US&page=4")! as URL,

class SearchRequest: BaseRequestProtocol {
    
    var query: String
    var includeAdult: Bool
    var pageNo: Int
    
    init(query: String,
         includeAdult: Bool = false,
         pageNo: Int = 1) {
        self.query = query
        self.includeAdult = includeAdult
        self.pageNo = pageNo
    }
    
    var url: URL? {
        return ApiPaths.searchMulti(query: query,
                                    adult: includeAdult,
                                    page: pageNo).url
    }
}
