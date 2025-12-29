//
//  MovieCreditsViewModel.swift
//  tmdb
//
//  Created by Vishank Raghav on 25/11/23.
//

import Foundation
import Observation

@Observable class MovieCreditsViewModel {
    
    var movieCastCredits: [MovieCreditsDM] = []
    var movieCrewCredits: [MovieCreditsDM] = []
    var categoryWiseCrew = [CreditsResponse.Cast.Department: [MovieCreditsDM]]()
    var departmentWiseCrew: [DepartmentWiseCrew] = []
    
    init(movieCastCredits: [MovieCreditsDM],
         movieCrewCredits: [MovieCreditsDM]) {
        self.movieCastCredits = movieCastCredits
        self.movieCrewCredits = movieCrewCredits
        constructCrewDepartment()
    }
    
    func constructCrewDepartment() {
        let crewCategory = Set(movieCrewCredits.map({ $0.department }))
        for category in crewCategory {
            let crew = movieCrewCredits.filter({ $0.department == category })
            departmentWiseCrew.append(DepartmentWiseCrew(department: category,
                                                         crewDM: crew))
        }
        
        departmentWiseCrew.sort { item1, item2 in
            item1.department.rawValue > item2.department.rawValue
        }
    }
}

struct DepartmentWiseCrew {
    var department: CreditsResponse.Cast.Department
    var crewDM: [MovieCreditsDM]
    
    init(department: CreditsResponse.Cast.Department,
         crewDM: [MovieCreditsDM]) {
        self.department = department
        self.crewDM = crewDM
    }
}
