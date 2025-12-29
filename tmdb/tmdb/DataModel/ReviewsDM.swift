//
//  ReviewsDM.swift
//  tmdb
//
//  Created by Vishank Raghav on 26/11/23.
//

import Foundation

struct ReviewsDM: Identifiable, Hashable {
    let author: String
    let authorDetails: ReviewsResponse.AuthorDetails
    let content: String
    let createdAt: String
    let id: String
    let updatedAt: String
    let url: String
    
    init(response: ReviewsResponse.Result? = nil) {
        self.author = response?.author ?? ""
        self.authorDetails = response?.authorDetails ?? .init(name: "",
                                                              username: "",
                                                              avatarPath: "",
                                                              rating: -1)
        self.content = response?.content ?? ""
        self.createdAt = response?.createdAt ?? ""
        self.id = response?.id ?? ""
        self.updatedAt = response?.updatedAt ?? ""
        self.url = response?.url ?? ""
    }
    
    var avatarURL: String {
        return "\(ImageSize.logoSize)\(self.authorDetails.avatarPath)"
    }
    
    var createdAtStr: String {
        return DateHelper.getDisplayDate(str: createdAt,
                                         sourceFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
                                         format: "MMM d, yyyy")
    }
}
