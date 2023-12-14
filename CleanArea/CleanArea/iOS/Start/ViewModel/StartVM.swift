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
    
    let citys: [String] = ["경기도", "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"]
        
    let employmentStatusOptions = ["전체선택", "재직자", "자영업자", "미취업자", "프리랜서", "일용근로자", "(예비)창업자", "단기근로자", "영농종사자", "제한없음"]
    
    let educationLevelOptions = ["전체선택", "고졸 미만", "고교 재학", "고졸 예정", "고교 졸업", "대학 재학", "대졸 예정", "대학 졸업", "석,박사", "제한없음"]
    
    let randomPos: [CGFloat] = [5, 24, 2, 17, 28, 27]
}
