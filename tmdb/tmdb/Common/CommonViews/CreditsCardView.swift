//
//  CreditsCardView.swift
//  tmdb
//
//  Created by Vishank Raghav on 23/11/23.
//

import SwiftUI

struct CreditsCardView: View {
    
    @State var showDetail: Bool = false
    @State var startAnimation: Bool = false
    
    var imageURL: String
    var title: String
    var subTitle: String
    var description: String
    
    init(imageURL: String,
         title: String,
         subTitle: String = "",
         description: String) {
        self.imageURL = imageURL
        self.title = title
        self.subTitle = subTitle
        self.description = description
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            imageView
            titleSubTitleView
            Spacer(minLength: 0)
        }
        .foregroundStyle(Color.black)
        .frame(width: 150)
        .frame(minHeight: 200)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .background(content: {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .clipped()
                .shadow(color: .gray, radius: 2)
        })
    }
}

extension CreditsCardView {
    @ViewBuilder
    var imageView: some View {
        AsyncCachedImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .onAppear {
                        showDetail = true
                    }
            case .failure(_):
                Image(systemName: "photo")
                    .onAppear {
                        showDetail = true
                    }
            @unknown default:
                Image(systemName: "photo")
                    .onAppear {
                        showDetail = true
                    }
            }
        }
        .frame(width: 150, height: 200)
        .clipped()
        .background {
            Color.gray.opacity(0.5)
        }
    }
    
    @ViewBuilder
    var titleSubTitleView: some View {
        VStack(alignment: .leading, spacing: 0) {
            if showDetail {
                Text(title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .font(.callout)
                    .lineLimit(nil)
                
                if !subTitle.isEmpty {
                    Text(subTitle)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(10)
    }
}

#Preview {
    CreditsCardView(imageURL: "w300/bkpPTZUdq31UGDovmszsg2CchiI.jpg",
                    title: "Title Title Title Title Title Title",
                    subTitle: "subTitle subTitle subTitle",
                    description: "description description description")
}
