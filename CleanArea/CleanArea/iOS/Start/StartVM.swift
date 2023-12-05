//
//  StartVM.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import Foundation

class StartVM: ObservableObject {
    @Published var residence: String = ""
    @Published var employmentStatus: String = ""
    @Published var educationLevel: String = ""
    @Published var age: String = ""
    @Published var policyName: String = ""
    
    let residenceOptions = ["서울", "남양", "의정부"]
    let employmentStatusOptions = ["직장인", "구직자", "학생"]
    let educationLevelOptions = ["고등학교 졸업", "대학생", "대학교 졸업", "석사", "박사"]
    
    func search() {
        
    }
    
}


