//
//  KeywordsDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 25/11/23.
//

import Foundation

struct KeywordsDM: Identifiable, Hashable {
    let id: Int
    let name: String
    
    init(response: KeywordsResponse.Keyword? = nil) {
        self.id = response?.id ?? -1
        self.name = response?.name ?? ""
    }
}
