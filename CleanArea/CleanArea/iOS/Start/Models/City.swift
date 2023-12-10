//
//  City.swift
//  CleanArea
//
//  Created by 이민호 on 12/7/23.
//

import Foundation

enum City: String, CaseIterable {
    case 수원시 = "003002008001"
    case 성남시 = "003002008002"
    case 의정부시 = "003002008003"
    case 안양시 = "003002008004"
    case 부천시 = "003002008005"
    case 광명시 = "003002008006"
    case 평택시 = "003002008007"
    case 동두천시 = "003002008008"
    case 안산시 = "003002008009"
    case 고양시 = "003002008010"
    case 과천시 = "003002008011"
    case 구리시 = "003002008012"
    case 남양주시 = "003002008013"
    case 오산시 = "003002008014"
    case 시흥시 = "003002008015"
    case 군포시 = "003002008016"
    case 의왕시 = "003002008017"
    case 하남시 = "003002008018"
    case 용인시 = "003002008019"
    case 파주시 = "003002008020"
    case 이천시 = "003002008021"
    case 안성시 = "003002008022"
    case 김포시 = "003002008023"
    case 화성시 = "003002008024"
    case 광주시 = "003002008025"
    case 양주시 = "003002008026"
    case 포천시 = "003002008027"
    case 여주시 = "003002008028"
    case 연천군 = "003002008031"
    case 가평군 = "003002008033"
    case 양평군 = "003002008034"
    
    func getString() -> String {
        switch self {
        case .수원시:
            return "수원시"
        case .성남시:
            return "성남시"
        case .의정부시:
            return "의정부시"
        case .안양시:
            return "안양시"
        case .부천시:
            return "부천시"
        case .광명시:
            return "광명시"
        case .평택시:
            return "평택시"
        case .동두천시:
            return "동두천시"
        case .안산시:
            return "안산시"
        case .고양시:
            return "고양시"
        case .과천시:
            return "과천시"
        case .구리시:
            return "구리시"
        case .남양주시:
            return "남양주시"
        case .오산시:
            return "오산시"
        case .시흥시:
            return "시흥시"
        case .군포시:
            return "군포시"
        case .의왕시:
            return "의왕시"
        case .하남시:
            return "하남시"
        case .용인시:
            return "용인시"
        case .파주시:
            return "파주시"
        case .이천시:
            return "이천시"
        case .안성시:
            return "안성시"
        case .김포시:
            return "김포시"
        case .화성시:
            return "화성시"
        case .광주시:
            return "광주시"
        case .양주시:
            return "양주시"
        case .포천시:
            return "포천시"
        case .여주시:
            return "여주시"
        case .연천군:
            return "연천군"
        case .가평군:
            return "가평군"
        case .양평군:
            return "양평군"
        }
    }
}
