//
//  MovieCreditsHListView.swift
//  tmdb
//
//  Created by Vishank Raghav on 09/12/23.
//

import SwiftUI

struct MovieCreditsHListView: View {
    
    var title: String
    var buttonTitle: String
    var credits: [MovieCreditsDM]
    var prefix: Int
    var viewModel: MovieCreditsViewModel
    
    init(title: String = "Cast",
         buttonTitle: String = "Full Cast & Crew",
         credits: [MovieCreditsDM],
         prefix: Int = 9,
         viewModel: MovieCreditsViewModel) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.credits = credits
        self.prefix = prefix
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer(minLength: 0)
                
                NavigationLink {
                    MovieCreditsView(viewModel: viewModel)
                } label: {
                    Text(buttonTitle)
                        .foregroundStyle(.link)
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(credits.prefix(prefix)) { item in
                        CreditsCardView(imageURL: item.profileURL,
                                        title: item.name,
                                        description: item.character)
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(.horizontal, 15.0, for: .scrollContent)
            .contentMargins(.bottom, 15.0, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    MovieCreditsHListView(credits: [],
                     viewModel: MovieCreditsViewModel(movieCastCredits: [],
                                                 movieCrewCredits: []))
}
