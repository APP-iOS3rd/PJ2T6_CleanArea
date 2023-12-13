//
//  City.swift
//  CleanArea
//
//  Created by 이민호 on 12/7/23.
//

import Foundation

enum City: String, CaseIterable {
    case 가평군 = "003002008033"
    case 고양시 = "003002008010"
    case 과천시 = "003002008011"
    case 광명시 = "003002008006"
    case 광주시 = "003002008025"
    case 구리시 = "003002008012"
    case 군포시 = "003002008016"
    case 김포시 = "003002008023"
    case 남양주시 = "003002008013"
    case 동두천시 = "003002008008"
    case 부천시 = "003002008005"
    case 성남시 = "003002008002"
    case 수원시 = "003002008001"
    case 시흥시 = "003002008015"
    case 안산시 = "003002008009"
    case 안성시 = "003002008022"
    case 안양시 = "003002008004"
    case 양주시 = "003002008026"
    case 양평군 = "003002008034"
    case 여주시 = "003002008028"
    case 연천군 = "003002008031"
    case 오산시 = "003002008014"
    case 용인시 = "003002008019"
    case 의왕시 = "003002008017"
    case 의정부시 = "003002008003"
    case 이천시 = "003002008021"
    case 파주시 = "003002008020"
    case 평택시 = "003002008007"
    case 포천시 = "003002008027"
    case 하남시 = "003002008018"
    case 화성시 = "003002008024"
}

extension City {
    func getString() -> String {
        switch self {
        case .가평군:
            return "가평"
        case .고양시:
            return "고양"
        case .과천시:
            return "과천"
        case .광명시:
            return "광명"
        case .광주시:
            return "광주"
        case .구리시:
            return "구리"
        case .군포시:
            return "군포"
        case .김포시:
            return "김포"
        case .남양주시:
            return "남양주"
        case .동두천시:
            return "동두천"
        case .부천시:
            return "부천"
        case .성남시:
            return "성남"
        case .수원시:
            return "수원"
        case .시흥시:
            return "시흥"
        case .안산시:
            return "안산"
        case .안성시:
            return "안성"
        case .안양시:
            return "안양"
        case .양주시:
            return "양주"
        case .양평군:
            return "양평"
        case .여주시:
            return "여주"
        case .연천군:
            return "연천"
        case .오산시:
            return "오산"
        case .용인시:
            return "용인"
        case .의왕시:
            return "의왕"
        case .의정부시:
            return "의정부"
        case .이천시:
            return "이천"
        case .파주시:
            return "파주"
        case .평택시:
            return "평택"
        case .포천시:
            return "포천"
        case .하남시:
            return "하남"
        case .화성시:
            return "화성"
        }
    }
}

//extension City {
//    func getString() -> String {
//        switch self {
//        case .가평군:
//            return "가평군"
//        case .고양시:
//            return "고양시"
//        case .과천시:
//            return "과천시"
//        case .광명시:
//            return "광명시"
//        case .광주시:
//            return "광주시"
//        case .구리시:
//            return "구리시"
//        case .군포시:
//            return "군포시"
//        case .김포시:
//            return "김포시"
//        case .남양주시:
//            return "남양주시"
//        case .동두천시:
//            return "동두천시"
//        case .부천시:
//            return "부천시"
//        case .성남시:
//            return "성남시"
//        case .수원시:
//            return "수원시"
//        case .시흥시:
//            return "시흥시"
//        case .안산시:
//            return "안산시"
//        case .안성시:
//            return "안성시"
//        case .안양시:
//            return "안양시"
//        case .양주시:
//            return "양주시"
//        case .양평군:
//            return "양평군"
//        case .여주시:
//            return "여주시"
//        case .연천군:
//            return "연천군"
//        case .오산시:
//            return "오산시"
//        case .용인시:
//            return "용인시"
//        case .의왕시:
//            return "의왕시"
//        case .의정부시:
//            return "의정부시"
//        case .이천시:
//            return "이천시"
//        case .파주시:
//            return "파주시"
//        case .평택시:
//            return "평택시"
//        case .포천시:
//            return "포천시"
//        case .하남시:
//            return "하남시"
//        case .화성시:
//            return "화성시"
//        }
//    }
//}

extension City {
    func getCityImage() -> String {
        switch self {
        case .가평군:
            return "Gapyeong"
        case .고양시:
            return "Goyang"
        case .과천시:
            return "Gwacheon"
        case .광명시:
            return "Gwangmyeong"
        case .광주시:
            return "Gwangju"
        case .구리시:
            return "Guri"
        case .군포시:
            return "Gunpo"
        case .김포시:
            return "Gimpo"
        case .남양주시:
            return "Namyangju"
        case .동두천시:
            return "Dongducheon"
        case .부천시:
            return "Bucheon"
        case .성남시:
            return "Seongnam"
        case .수원시:
            return "Suwon"
        case .시흥시:
            return "Siheung"
        case .안산시:
            return "Ansan"
        case .안성시:
            return "Anseong"
        case .안양시:
            return "Anyang"
        case .양주시:
            return "Yangju"
        case .양평군:
            return "Yangpyeong"
        case .여주시:
            return "Yeoju"
        case .연천군:
            return "Yeoncheon"
        case .오산시:
            return "Osan"
        case .용인시:
            return "Yongin"
        case .의왕시:
            return "Uiwang"
        case .의정부시:
            return "Uijeongbu"
        case .이천시:
            return "Icheon"
        case .파주시:
            return "Paju"
        case .평택시:
            return "Pyeongtaek"
        case .포천시:
            return "Pocheon"
        case .하남시:
            return "Hanam"
        case .화성시:
            return "Hwaseong"
        }
    }
}
