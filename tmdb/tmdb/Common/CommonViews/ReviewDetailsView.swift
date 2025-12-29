//
//  ReviewDetailsView.swift
//  tmdb
//
//  Created by Vishank Raghav on 27/11/23.
//

import SwiftUI

struct ReviewDetailsView: View {
    
    var review: ReviewsDM
    var isLineLimitEnabled: Bool = false
    var isDividerVisible: Bool = true
    var onTap: (() -> Void)?
    
    var body: some View {
        VStack {
            headerView
            if isDividerVisible {
                Divider()
                    .frame(height: 2)
                    .padding(.vertical, 5)
            }
            reviewText
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onTapGesture {
            self.onTap?()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension ReviewDetailsView {
    
    var headerView: some View {
        HStack(alignment: .center) {
            imageView
            
            VStack(alignment: .leading, spacing: 5) {
                Text("A review by **\(review.author)**")
                
                HStack {
                    ratingView
                    Text("written on \(review.createdAtStr)")
                        .font(.footnote)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var imageView: some View {
//        AsyncImage(url: review.avatarURL) { phase in
//            switch phase {
//            case .empty:
//                ProgressView()
//            case .success(let image):
//                image
//                    .resizable()
//                    .scaledToFit()
//            case .failure(_):
//                Image(systemName: "person")
//            @unknown default:
//                ProgressView()
//            }
//        }
        CachedImageVew(url: review.avatarURL)
            .scaledToFit()
        .frame(width: 50, height: 50)
        .background {
            Color.gray.opacity(0.5)
        }
        .clipShape(Circle())
        .clipped()
    }
    
    var ratingView: some View {
        Label {
            Text("\(Double(review.authorDetails.rating ?? 0), specifier: "%.1f")")
                .font(.footnote)
                .fontWeight(.medium)
        } icon: {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 10, height: 10)
        }
        .foregroundStyle(Color.white)
        .padding(2)
        .padding(.horizontal, 5)
        .background(content: {
            Capsule(style: .circular)
        })
    }
    
    @ViewBuilder
    var reviewText: some View {
        if isLineLimitEnabled {
            Text(review.content.replacingOccurrences(of: ">", with: ""))
                .font(.callout)
                .multilineTextAlignment(.leading)
                .lineLimit(5)
        } else {
            ScrollView(.vertical) {
                Text(review.content.replacingOccurrences(of: ">", with: ""))
                    .font(.callout)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

#Preview {
    ReviewDetailsView(
        review: ReviewsDM(
            response: .init(
                author: "Demo",
                authorDetails: .init(name: "",
                                     username: "",
                                     avatarPath: "",
                                     rating: -1),
                content: "Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review Review",
                createdAt: "",
                id: "",
                updatedAt: "",
                url: "")))
}
