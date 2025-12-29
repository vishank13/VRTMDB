//
//  PosterView.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import SwiftUI

struct PosterView: View {
    
    @State var showDetail: Bool = false
    
    var imageURL: String
    var title: String
    var subTitle: String
    var rating: Double
    
    init(imageURL: String,
         title: String,
         subTitle: String,
         rating: Double = 0.0) {
        self.imageURL = imageURL
        self.title = title
        self.subTitle = subTitle
        self.rating = rating
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            imageView
            titleSubTitleView
            Spacer(minLength: 0)
        }
        .frame(width: 100)
        .frame(minHeight: 240)
    }
}

extension PosterView {
    @ViewBuilder
    var imageView: some View {
        AsyncCachedImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .onAppear {
                        showDetail = true
                    }
            case .failure(_):
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .onAppear {
                    showDetail = true
                }
            @unknown default:
                ProgressView()
            }
        }
        .frame(width: 100, height: 150)
        .background {
            Color.gray.opacity(0.5)
        }
        .overlay(alignment: .bottomLeading) {
            if showDetail {
                RatingsView(rating: rating)
                    .padding(5)
                    .offset(y: 15)
            }
        }
    }
    
    @ViewBuilder
    var titleSubTitleView: some View {
        if showDetail {
            Text(title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .font(.body)
                .lineLimit(3)
                .foregroundStyle(Color.primary)
            
            Text(subTitle)
                .font(.footnote)
                .foregroundStyle(Color.secondary)
                .lineLimit(1, reservesSpace: true)
        }
    }
}

#Preview {
    PosterView(imageURL: "",
               title: "Title",
               subTitle: "SubTitle",
               rating: 50.0)
}
