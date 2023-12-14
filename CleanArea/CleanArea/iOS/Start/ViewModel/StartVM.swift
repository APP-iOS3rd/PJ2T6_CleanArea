//
//  StartVM.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import SwiftUI

class StartVM: ObservableObject {
    
    @Published var residence: City?
    @Published var employmentStatus: String = ""
    @Published var educationLevel: String = ""
    @Published var age: String = ""
    @Published var policyName: String = ""
        
     let employmentStatusOptions = ["재직자", "자영업자", "미취업자", "프리랜서", "일용근로자", "(예비)창업자", "단기근로자", "영농종사자", "제한없음"]
     let educationLevelOptions = ["고졸 미만", "고교 재학", "고졸 예정", "고교 졸업", "대학 재학", "대졸 예정", "대학 졸업", "석,박사", "제한없음"]
}
