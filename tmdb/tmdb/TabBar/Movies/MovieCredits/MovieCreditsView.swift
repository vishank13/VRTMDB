//
//  MovieCreditsView.swift
//  tmdb
//
//  Created by Vishank Raghav on 25/11/23.
//

import SwiftUI

struct MovieCreditsView: View {
    
    @State var viewModel: MovieCreditsViewModel
    @State var showCast: Bool = false
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 15) {
                castView
                crewView
            }
        }
        .navBar(title: "Full Cast & Crew")
        .toolbar(.hidden, for: .tabBar)
    }
}

extension MovieCreditsView {
    
    var castView: some View {
        VStack {
            HStack {
                Text("Cast \(viewModel.movieCastCredits.count)")
                    .font(.title2)
                    .fontWeight(.heavy)
                
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    withAnimation {
                        self.showCast.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.headline)
                        .rotationEffect(.degrees(showCast ? 90 : 0))
                }
            }
            .padding(.horizontal)
            
            if showCast {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.movieCastCredits, id: \.uuid) { cast in
                        CreditsCardView(imageURL: cast.profileURL,
                                        title: cast.name,
                                        description: cast.character)
                    }
                }
                .padding(.vertical)
            }
        }
    }
    
    var crewView: some View {
        VStack {
            Text("Crew")
                .font(.title2)
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(viewModel.departmentWiseCrew,id: \.department) { crewList in
                ColapsableGridView(item: crewList)
                Divider().padding(.horizontal)
            }
        }
    }
}

#Preview {
    MovieCreditsView(viewModel: MovieCreditsViewModel(movieCastCredits:  [
        MovieCreditsDM(response: .init(adult: nil,
                                  gender: nil,
                                  id: 1,
                                  knownForDepartment: nil,
                                  name: "Demo",
                                  originalName: nil,
                                  popularity: nil,
                                  profilePath: "/3DZAf9CwXmfV2HZOEdqeZAGTndV.jpg",
                                  castID: nil,
                                  character: "Demo",
                                  creditID: nil,
                                  order: nil,
                                  department: nil,
                                  job: nil)),
        MovieCreditsDM(response: .init(adult: nil,
                                  gender: nil,
                                  id: 2,
                                  knownForDepartment: nil,
                                  name: "Demo2",
                                  originalName: nil,
                                  popularity: nil,
                                  profilePath: "/xDc01ud6ZtaJFQWg8YfffFlUBdY.jpg",
                                  castID: nil,
                                  character: "Demo2",
                                  creditID: nil,
                                  order: nil,
                                  department: nil,
                                  job: nil))
    ], movieCrewCredits: [
        MovieCreditsDM(response: .init(adult: nil,
                                  gender: nil,
                                  id: 1,
                                  knownForDepartment: nil,
                                  name: "Demo",
                                  originalName: nil,
                                  popularity: nil,
                                  profilePath: "/3DZAf9CwXmfV2HZOEdqeZAGTndV.jpg",
                                  castID: nil,
                                  character: "Demo",
                                  creditID: nil,
                                  order: nil,
                                  department: nil,
                                  job: nil)),
        MovieCreditsDM(response: .init(adult: nil,
                                  gender: nil,
                                  id: 2,
                                  knownForDepartment: nil,
                                  name: "Demo2",
                                  originalName: nil,
                                  popularity: nil,
                                  profilePath: "/xDc01ud6ZtaJFQWg8YfffFlUBdY.jpg",
                                  castID: nil,
                                  character: "Demo2",
                                  creditID: nil,
                                  order: nil,
                                  department: nil,
                                  job: nil))
    ]))
}

struct ColapsableGridView: View {
    
    var item: DepartmentWiseCrew
    @State var showCrew: Bool = false
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(item.department.rawValue) \(item.crewDM.count)")
                    .font(.body)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    withAnimation {
                        self.showCrew.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.headline)
                        .rotationEffect(.degrees(showCrew ? 90 : 0))
                }
            }
            .padding(.horizontal)
            
            if showCrew {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(item.crewDM, id: \.uuid) { crew in
                        CreditsCardView(imageURL: crew.profileURL,
                                        title: crew.name,
                                        description: crew.job)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}
