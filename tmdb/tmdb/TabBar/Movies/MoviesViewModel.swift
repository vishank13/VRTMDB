//
//  MoviesViewModel.swift
//  tmdb
//
//  Created by Vishank Raghav on 27/11/23.
//

import Foundation
import Observation
import SwiftUI

@Observable class MoviesViewModel {
    
    var showLoader: Bool = false
    var nowPlaying: [MoviesDM] = []
    var popular: [MoviesDM] = []
    var topRated: [MoviesDM] = []
    var upcoming: [MoviesDM] = []
    
    init() {
        getMoviesData()
    }
    
    func getMoviesData() {
        showLoader = true
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getNowPlaying()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getPopular()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getTopRated()
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            self.getUpcoming()
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.showLoader = false
        }
    }
    
    func getNowPlaying() {
        NetworkManager.shared.makeRequest(req: NowPlayingRequest()) { (response: NowPlayingResponse) in
            self.nowPlaying = response.results?.compactMap({ MoviesDM(response: $0) }) ?? []
        }
    }
    
    func getPopular() {
        NetworkManager.shared.makeRequest(req: PopularRequest()) { (response: PopularResponse) in
            self.popular = response.results?.compactMap({ MoviesDM(response: $0) }) ?? []
        }
    }
    
    func getTopRated() {
        NetworkManager.shared.makeRequest(req: TopRatedRequest()) { (response: TopRatedResponse) in
            self.topRated = response.results?.compactMap({ MoviesDM(response: $0) }) ?? []
        }
    }
    
    func getUpcoming() {
        NetworkManager.shared.makeRequest(req: UpcomingRequest()) { (response: UpcomingResponse) in
            self.upcoming = response.results?.compactMap({ MoviesDM(response: $0) }) ?? []
            
            self.upcoming.sort { item1, item2 in
                guard let date1 = DateHelper.getDateFrom(str: item1.releaseDate),
                      let date2 = DateHelper.getDateFrom(str: item2.releaseDate) else {
                    return false
                }
               return date1 > date2
            }
        }
    }
    
}
