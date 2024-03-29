//
//  TFStyleViewModifier.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import SwiftUI

enum TextFieldType {
    case residence, employmentStatus, educationLevel, age, policyName
    
    var title: String {
        switch self {
        case .residence:
            return "주거지를 선택하세요"
        case .employmentStatus:
            return "취업상태를 선택하세요"
        case .educationLevel:
            return "학력을 선택하세요"
        case .age:
            return "(만)나이를 입력하세요"
        case .policyName:
            return "관심있는 정책 이름을 입력해주세요"
        }
    }
    
    var placeholder: String {
        switch self {
        case .residence:
            return "지역선택"
        case .employmentStatus:
            return "취업상태 선택"
        case .educationLevel:
            return "학력선택"
        case .age:
            return "EX) 27"
        case .policyName:
            return "EX) 국민취업지원제도"
        }
    }
    
    var isSelectable: Bool {
        switch self {
        case .residence, .employmentStatus, .educationLevel:
            return true
        default:
            return false
        }
    }
}
