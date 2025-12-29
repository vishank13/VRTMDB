//
//  SearchView.swift
//  tmdb
//
//  Created by Vishank Raghav on 23/12/23.
//

import SwiftUI

struct SearchView: View {
    @State var viewModel: SearchViewModel
    @State var searchText: String = ""
    @State var scrollPosition: Int?
    
    var body: some View {
        BaseStack(showLoader: $viewModel.showLoader) {
            VStack {
                searchField
                if viewModel.filteredSearchData.isEmpty {
                    ContentUnavailableView.search
                } else {
                    searchList
                }
            }
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(for: SearchDM.self) { item in
            switch item.mediaType {
            case .movie:
                MovieDetailsView(viewModel: MovieDetailsViewModel(movieID: item.id))
            case .tv:
                TVDetailsView(viewModel: TVDetailsViewModel(seriesID: item.id))
            case .person:
                Text("Hello")
            case .none:
                Text("Hello")
            }
        }
    }
}

extension SearchView {
    
    var searchField: some View {
        HStack(alignment: .top) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                    .foregroundStyle(.secondary)
                
                TextField("Search for movie, tv show, person.... ", text: $searchText)
                    .autocorrectionDisabled()
                
                if !searchText.isEmpty {
                    Button {
                        searchText = ""
                        viewModel.searchData.removeAll()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .renderingMode(.template)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .onSubmit {
                viewModel.performSearch(for: searchText) { id in
                    self.scrollPosition = id
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary.opacity(0.2))
            }
            
            filterIconView
        }
        .padding(.horizontal)
    }
    
    var filterIconView: some View {
        Menu("", systemImage: "line.3.horizontal.decrease") {
            Button {
                viewModel.filterSearch(type: .movie)
            } label: {
                HStack {
                    Text("Movie \(viewModel.getMediaCount(type: .movie))")
                    if viewModel.mediaType == .movie {
                        Image(systemName: "checkmark")
                    }
                }
            }
            
            Button {
                viewModel.filterSearch(type: .tv)
            } label: {
                HStack {
                    Text("TV \(viewModel.getMediaCount(type: .tv))")
                    if viewModel.mediaType == .tv {
                        Image(systemName: "checkmark")
                    }
                }
            }
            
            Button {
                viewModel.filterSearch(type: .person)
            } label: {
                HStack {
                    Text("Person \(viewModel.getMediaCount(type: .person))")
                    if viewModel.mediaType == .person {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .foregroundStyle(Color.primary)
        .overlay(alignment: .top) {
            Circle()
                .frame(width: 7, height: 7)
                .foregroundStyle(.red)
                .offset(x: 2.0)
        }
    }
    
    var searchList: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(viewModel.filteredSearchData) { item in
                    NavigationLink(value: item) {
                        searchRowView(title: item.displayTitle,
                                      description: item.description,
                                      image: item.imageURL)
                    }
                    HDividerView()
                }
            }
        }
        .scrollPosition(id: $scrollPosition)
        .scrollIndicators(.hidden, axes: .vertical)
        .contentMargins(.horizontal, 15, for: .scrollContent)
    }
    
    @ViewBuilder
    func imageView(url: String) -> some View {
        AsyncCachedImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(_):
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            @unknown default:
                ProgressView()
            }
        }
        .frame(width: 80, height: 120)
        .clipped()
        .background {
            Color.gray.opacity(0.5)
        }
    }
    
    @ViewBuilder
    func searchRowView(title: String,
                       description: String,
                       image: String) -> some View {
        HStack(alignment: .top) {
            imageView(url: image)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
