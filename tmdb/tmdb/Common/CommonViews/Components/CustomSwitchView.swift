//
//  CustomSwitchView.swift
//  tmdb
//
//  Created by Vishank Raghav on 19/11/23.
//

import SwiftUI

struct CustomSwitchView: View {
    
    @Binding var leftSelected: Bool
    var leftTitle: String
    var rightTitle: String
    var onTap: ((SwitchState)->Void)?
    
    enum SwitchState {
        case left
        case right
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Text(leftTitle)
                    .font(.caption)
                    .foregroundStyle(leftSelected ? .white : .black)
                    .frame(width: 40)
                    .onTapGesture {
                        leftSelected = true
                        onTap?(.left)
                    }
//                    .background(Color.red)
                Spacer(minLength: 0)
                Text(rightTitle)
                    .font(.caption)
                    .foregroundStyle(leftSelected ? .black : .white)
                    .frame(width: 40)
                    .onTapGesture {
                        leftSelected = false
                        onTap?(.right)
                    }
//                    .background(Color.gray)
            }
            .padding(.vertical, 5)
            .frame(width: 90)
            .background {
                ZStack {
                    Capsule(style: .circular)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color.black)
                    
                    Capsule(style: .circular)
                        .fill(Color.black)
                        .frame(width: 45)
                        .offset(x: leftSelected ? -22.5 : 22.5)
                        
                }
            }
            .animation(.spring(),
                       value: leftSelected)
            
        }
    }
}

#Preview {
    CustomSwitchView(leftSelected: .constant(true),
                     leftTitle: "",
                     rightTitle: "") { state in
        switch state {
        case .left:
            print("left")
        case .right:
            print("right")
        }
    }
}
