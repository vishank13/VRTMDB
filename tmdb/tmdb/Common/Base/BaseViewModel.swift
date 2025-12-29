//
//  BaseViewModel.swift
//  tmdb
//
//  Created by Vishank Raghav on 24/12/23.
//

import Foundation
import Observation

@Observable class BaseViewModel {
    var showLoader: Bool = false
    
    init() {
        
    }
    
    func loaderAppearance(_ show: Bool) {
        self.showLoader = show
    }
}
