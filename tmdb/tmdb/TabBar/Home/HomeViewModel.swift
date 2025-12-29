//
//  HomeViewModel.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import Foundation
import Observation

@Observable class HomeViewModel {
    var trendingContent: [TrendingContentDM] = []
    var trendingPeople: [TrendingPeopleDM] = []
    var showMovies: Bool = true
    
    init() {
        self.getTrendingContent()
        self.getTrendingPeople()
    }
    
    func getTrendingContent() {
        NetworkManager.shared.makeRequest(req: TrendingContentRequest(isMovie: showMovies,
                                                                      time: .day)) { (response: TrendingContentResponse) in
            self.trendingContent = response.results?.compactMap({ TrendingContentDM(response: $0) }) ?? []
        }
    }
    
    func getTrendingPeople() {
        NetworkManager.shared.makeRequest(req: TrendingPeopleRequest(time: .day)) { (response: TrendingPeopleResponse) in
            self.trendingPeople = response.results?.compactMap({ TrendingPeopleDM(response: $0) }) ?? []
        }
    }
}
