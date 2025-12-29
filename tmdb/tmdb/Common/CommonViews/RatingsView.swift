//
//  RatingsView.swift
//  tmdb
//
//  Created by Vishank Raghav on 09/12/23.
//

import SwiftUI

struct RatingsView: View {
    
    var rating: Double
    var size: CGFloat
    
    @State var startAnimation: Bool = false
    
    init(rating: Double = 0.0,
         size: CGFloat = 40) {
        self.rating = rating
        self.size = size
    }
    
    private var getRatingColor: Color {
        if 0..<3 ~= rating {
            return .red
        } else if 3..<7 ~= rating {
            return .yellow
        } else if 7... ~= rating {
            return .green
        }
        return.clear
    }
    
    private var outerCircle: CGFloat {
        size * 1.25
    }
    
    private var innerCircle: CGFloat {
        size
    }
    
    private var lineWidth: CGFloat {
        size * 0.075
    }
    
    private var textSize: CGFloat {
        size - lineWidth
    }
    
    var body: some View {
        ZStack {
            if rating > 0.0 {
                Circle()
                    .fill(Color.black)
                    .frame(width: outerCircle,
                           height: outerCircle)
                
                Circle()
                    .fill(Color.black)
                    .stroke(getRatingColor.opacity(0.3),
                            lineWidth: lineWidth)
                    .frame(width: size,
                           height: size)
                
                Circle()
                    .trim(from: 0,
                          to: startAnimation ? rating/10 : 0)
                    .stroke(getRatingColor,
                            style: StrokeStyle(lineWidth: lineWidth,
                                               lineCap: .round))
                    .frame(width: size,
                           height: size)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 2),
                               value: startAnimation)
                    .onAppear {
                        startAnimation = true
                    }
                
                HStack(alignment:.top, spacing: 0) {
                    Text("\(rating*10, specifier: "%.0f")")
                        .foregroundStyle(.white)
                        .font(.headline)
                    Text("%")
                        .foregroundStyle(.white)
                        .font(.caption2)
                }
                .minimumScaleFactor(0.01)
                .frame(width: textSize,
                       height: textSize)
                .padding(lineWidth)
            }
        }
    }
}

#Preview {
    RatingsView(rating: 7.9,
                size: 60)
}
