//
//  SearchViewModel.swift
//  tmdb
//
//  Created by Vishank Raghav on 24/12/23.
//

import Foundation
import Observation

@Observable class SearchViewModel: BaseViewModel {
    
    var searchData: [SearchDM] = []
    var filteredSearchData: [SearchDM] = []
    var mediaType: MediaType = MediaType.movie
    
    //MARK: - Initializers
    override init() {
        super.init()
        performSearch(for: "marvel")
    }
    
    //MARK: - Public Methods
    func performSearch(for query: String,
                       completion: ((Int?)->Void)? = nil) {
        guard !query.isEmpty else { return }
        
        self.loaderAppearance(true)
        
        NetworkManager.shared.makeRequest(req: SearchRequest(query: query)) { (response: SearchResponse) in
            //            completion?(self.searchData.first?.id)
            
            guard let currentPage = response.page,
                  let totalPages = response.totalPages,
                  currentPage < totalPages else {
                self.loaderAppearance(false)
                self.searchData = response.results?.compactMap({ SearchDM.init(response: $0) }) ?? []
                self.filterSearch(type: self.mediaType)
                return
            }
            let data = response.results?.compactMap({ SearchDM.init(response: $0) }) ?? []
            /*self.searchData.append(contentsOf:*/
            self.fetchAllData(firstResponse: data,
                              for: query,
                              pageNo: currentPage + 1,
                              totalPageNo: totalPages)//)
            //            self.filterSearch(type: self.mediaType)
        }
    }
    
    func fetchAllData(firstResponse: [SearchDM],
                      for query: String,
                      pageNo: Int,
                      totalPageNo: Int) /*-> [SearchDM]*/ {
        //        var searchData: [SearchDM] = []
        
        DispatchQueue.main.async {
            self.searchData = firstResponse
            for i in pageNo...totalPageNo {
                NetworkManager.shared.makeRequest(req: SearchRequest(query: query,
                                                                     pageNo: i)) { (response: SearchResponse) in
                    self.searchData.append(contentsOf: response.results?.compactMap({ SearchDM.init(response: $0) }) ?? [])
                    
                    if i == totalPageNo {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            self.loaderAppearance(false)
                            self.filterSearch(type: self.mediaType)
                        }
                    }
                }
            }
            self.filterSearch(type: self.mediaType)
        }
        
        //        return searchData
    }
    
    func filterSearch(type: MediaType) {
        self.mediaType = type
        
        switch mediaType {
        case .movie:
            self.filteredSearchData = searchData.filter({ $0.mediaType == .movie })
        case .person:
            self.filteredSearchData = searchData.filter({ $0.mediaType == .person })
        case .tv:
            self.filteredSearchData = searchData.filter({ $0.mediaType == .tv })
        case .none:
            self.filteredSearchData = searchData
        }
    }
    
    func getMediaCount(type: MediaType) -> Int {
        return searchData.filter({ $0.mediaType == type }).count
    }
}
