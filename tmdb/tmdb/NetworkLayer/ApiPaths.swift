//
//  ApiPaths.swift
//  tmdb
//
//  Created by Vishank Raghav on 26/11/23.
//

import Foundation

enum ApiPaths {
    case trendingMovie(time: String)
    case trendingTV(time: String)
    case trendingPeople(time: String)
    
    case movieNowPlaying
    case moviePopular
    case movieTopRated
    case movieUpcoming
    
    case movieDetails(movieID: Int)
    case movieCredits(movieID: Int)
    case movieKeywords(movieID: Int)
    case movieRecommendations(movieID: Int)
    case movieReviews(movieID: Int)
    case movieImages(movieID: Int)
    
    case tvDetails(seriesID: Int)

    case searchMulti(query: String, adult: Bool, page: Int)
}

extension ApiPaths {
    
    var host: String {
        "api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .trendingMovie(let time):
            "/3/trending/movie/\(time)"
        case .trendingTV(let time):
            "/3/trending/tv/\(time)"
        case .trendingPeople(let time):
            "/3/trending/person/\(time)"
        case .movieNowPlaying:
            "/3/movie/now_playing"
        case .moviePopular:
            "/3/movie/popular"
        case .movieTopRated:
            "/3/movie/top_rated"
        case .movieUpcoming:
            "/3/movie/upcoming"
        case .movieDetails(let movieID):
            "/3/movie/\(movieID)"
        case .movieCredits(let movieID):
            "/3/movie/\(movieID)/credits"
        case .movieKeywords(let movieID):
            "/3/movie/\(movieID)/keywords"
        case .movieRecommendations(let movieID):
            "/3/movie/\(movieID)/recommendations"
        case .movieReviews(let movieID):
            "/3/movie/\(movieID)/reviews"
        case .movieImages(let movieID):
            "/3/movie/\(movieID)/images"
        case .tvDetails(seriesID: let seriesID):
            "/3/tv/\(seriesID)"
        case .searchMulti:
            "/3/search/multi"
        }
    }
    
    var queryItems: [String: String]? {
        switch self {
        case .searchMulti(let query, let adult, let page):
            return ["query":"\(query)",
                    "include_adult":"\(adult)",
                    "page":"\(page)"]
        default:
            return nil
        }
    }
    
    var url: URL? {
        var urlComp = URLComponents()
        urlComp.scheme = "https"
        urlComp.host = self.host
        urlComp.path = self.path
        
        var reqQueryItems = [URLQueryItem]()
        queryItems?.compactMap { item in
            reqQueryItems.append(URLQueryItem(name: item.key, value: item.value))
        }
        
        reqQueryItems.append(URLQueryItem(name: "language", value: "en-US"))
        urlComp.queryItems = reqQueryItems
        
        return urlComp.url
    }
}
