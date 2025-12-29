//
//  BaseHListView.swift
//  tmdb
//
//  Created by Vishank Raghav on 28/11/23.
//

import SwiftUI

struct BaseHListView<Content: View, Data, ID>: View where Data: RandomAccessCollection, ID: Hashable {
    @Environment(\.verticalSizeClass) var vSizeClass
    @Binding private var scrollID: Int?
    private var hasScrollView: Bool
    private var scrollIndicator: ScrollIndicatorVisibility
    private var contentMargin: CGFloat
    private var data: Data
    private var id: KeyPath<Data.Element, ID>
    private var content: (Data.Element) -> Content
    
    init(hasScrollView: Bool = true,
         scrollID: Binding<Int?> = .constant(-1),
         scrollIndicator: ScrollIndicatorVisibility = .hidden,
         contentMargin: CGFloat = 15,
         data: Data,
         id: KeyPath<Data.Element, ID>,
         @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self._scrollID = scrollID
        self.hasScrollView = hasScrollView
        self.scrollIndicator = scrollIndicator
        self.contentMargin = contentMargin
        self.data = data
        self.id = id
        self.content = content
    }
    
    var body: some View {
        if hasScrollView {
            ScrollView(.horizontal) {
                listView
            }
            .scrollIndicators(scrollIndicator, axes: .horizontal)
            .contentMargins(.horizontal, contentMargin, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $scrollID)
        } else {
            listView
        }
    }
    
    @ViewBuilder
    var listView: some View {
        LazyHStack {
            ForEach(data, id: id) { data in
                content(data)
                    .scrollTransition { effect, phase in
                        effect
                            .scaleEffect(phase.isIdentity ? 1 : 0.75)
                    }
            }
        }
        .scrollTargetLayout()
    }
}
