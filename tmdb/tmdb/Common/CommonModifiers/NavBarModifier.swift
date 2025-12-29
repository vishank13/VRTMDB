//
//  NavBarModifier.swift
//  tmdb
//
//  Created by Vishank Raghav on 27/11/23.
//

import SwiftUI

class navBarDependency {
    var leftButtonAction: (()->Void)?
    var leftSystemImage: String
    
    var rightButtonAction: (()->Void)?
    var rightSystemImage: String
    
    var title: String
    
    init(leftButtonAction: ( () -> Void)? = nil,
         leftSystemImage: String = "chevron.left",
         rightButtonAction: ( () -> Void)? = nil,
         rightSystemImage: String = "",
         title: String) {
        self.leftButtonAction = leftButtonAction
        self.leftSystemImage = leftSystemImage
        self.rightButtonAction = rightButtonAction
        self.rightSystemImage = rightSystemImage
        self.title = title
    }
}
struct NavBar: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    var title: String
    var leftButtonAction: (()->Void)?
    var leftSystemImage: String
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
//                        leftButtonAction?()
                        dismiss()
                    }, label: {
                        Image(systemName: leftSystemImage)
                    })
                }
                
                ToolbarItem(placement: .principal) {
                    Text(title)
                }
            })
    }
}

extension View {
    
    func navBar(title: String = "",
                leftButtonAction: (()->Void)? = nil,
                leftSystemImage: String = "chevron.left") -> some View {
        modifier(NavBar(title: title,
                        leftButtonAction: leftButtonAction,
                        leftSystemImage: leftSystemImage))
    }
}
