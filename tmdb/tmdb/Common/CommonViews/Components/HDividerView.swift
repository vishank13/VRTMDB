//
//  HDividerView.swift
//  tmdb
//
//  Created by Vishank Raghav on 09/12/23.
//

import SwiftUI

struct HDividerView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 1)
            .fill(Color.secondary.opacity(0.2))
            .frame(height: 1)
            .padding(.horizontal)
    }
}

#Preview {
    HDividerView()
}
