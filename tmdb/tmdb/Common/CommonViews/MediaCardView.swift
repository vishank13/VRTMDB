//
//  MediaCardView.swift
//  tmdb
//
//  Created by Vishank Raghav on 26/11/23.
//

import SwiftUI

struct MediaCardView: View {
    
    var recommendedItem: RecommendationsDM
    
    var body: some View {
        AsyncCachedImage(url: recommendedItem.backdropURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure(_):
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            @unknown default:
                ProgressView()
            }
        }
        .frame(width: 350, height: 250)
        .overlay(alignment: .bottom, content: {
            HStack(alignment: .top) {
                Text(recommendedItem.title)
                    .lineLimit(2, reservesSpace: true)
                Spacer(minLength: 0)
                Text("\(recommendedItem.voteAverage*10, specifier: "%.0f")%")
            }
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.black)
            .padding(5)
            .background {
                Color.white
            }
        })
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .clipped()
        .frame(width: 350)
        .background(content: {
            Color.gray.opacity(0.5)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .clipped()
                .shadow(color: .gray, radius: 2)
        })
    }
}

#Preview {
    MediaCardView(recommendedItem: .init(response:
            .init(adult: nil,
                  backdropPath: nil,
                  id: nil,
                  title: "Demo",
                  originalLanguage: nil,
                  originalTitle: nil,
                  overview: nil,
                  posterPath: nil,
                  mediaType: nil,
                  genreIDS: nil,
                  popularity: nil,
                  releaseDate: nil,
                  video: nil,
                  voteAverage: 9.0,
                  voteCount: nil)))
}
