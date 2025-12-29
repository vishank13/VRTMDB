//
//  BaseStack.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import SwiftUI

struct BaseStack<Content: View>: View {
    
    @Binding var showLoader: Bool
    let content: Content
    
    init(showLoader: Binding<Bool> = .constant(false),
         @ViewBuilder content: () -> Content) {
        self._showLoader = showLoader
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
                .background(.clear)
            
            if showLoader {
                ZStack {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    
                    VStack {
                        ProgressView()
                        
                        Text("Loading")
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
