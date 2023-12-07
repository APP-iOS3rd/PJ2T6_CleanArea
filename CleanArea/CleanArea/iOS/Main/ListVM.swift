//
//  ListVM.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import Foundation

class ListVM: ObservableObject {
    @Published var popularPolicyItems = [
        PolicyItem(sequenceNumber: 1,
                   polyBizSjnm: "국민취업지원제도",
                   progress: "proceed",
                   bizPrdCn: "2023.01.01 ~ 2024.01.31",
                   remainDate: "D-21",
                   polyCategory: "교육분야"),
        PolicyItem(sequenceNumber: 2,
                   polyBizSjnm: "서울 안심주택 지원제도",
                   progress: "allTimes",
                   bizPrdCn: "",
                   remainDate: "",
                   polyCategory: "주거분야"),
        PolicyItem(sequenceNumber: 3,
                   polyBizSjnm: "청년도전사업",
                   progress: "deadline",
                   bizPrdCn: "2023.01.01 ~ 2023.05.31",
                   remainDate: "D-0",
                   polyCategory: "교육분야"),
        PolicyItem(sequenceNumber: 4,
                   polyBizSjnm: "청년 일자리 도약 지원금",
                   progress: "proceed",
                   bizPrdCn: "2023.01.01 ~ 2024.05.31",
                   remainDate: "D-182",
                   polyCategory: "일자리분야")
    ]
    
    @Published var likePolicyItems = [
        PolicyItem(polyBizSjnm: "국민취업지원제도",
                   progress: "proceed",
                   bizPrdCn: "2023.01.01 ~ 2024.01.31",
                   remainDate: "D-21",
                   polyCategory: "교육분야"),
        PolicyItem(polyBizSjnm: "서울 안심주택 지원제도",
                   progress: "allTimes",
                   bizPrdCn: "",
                   remainDate: "",
                   polyCategory: "주거분야"),
        PolicyItem(polyBizSjnm: "청년도전사업",
                   progress: "deadline",
                   bizPrdCn: "2023.01.01 ~ 2023.05.31",
                   remainDate: "D-0",
                   polyCategory: "교육분야"),
        PolicyItem(polyBizSjnm: "청년 일자리 도약 지원금",
                   progress: "proceed",
                   bizPrdCn: "2023.01.01 ~ 2024.05.31",
                   remainDate: "D-182",
                   polyCategory: "일자리분야")
    ]
    
    @Published var recommandPolicyItems = [
        PolicyItem(polyBizSjnm: "청년 월세지원정책",
                   progress: "proceed",
                   bizPrdCn: "2023.01.01 ~ 2024.01.31",
                   remainDate: "D-21",
                   polyCategory: "주거분야"),
        PolicyItem(polyBizSjnm: "서울시 청년 안심주택",
                   progress: "allTimes",
                   bizPrdCn: "",
                   remainDate: "",
                   polyCategory: "주거분야"),
        PolicyItem(polyBizSjnm: "청년내일저축계좌",
                   progress: "deadline",
                   bizPrdCn: "2023.01.01 ~ 2023.05.31",
                   remainDate: "D-0",
                   polyCategory: "주거분야"),
        PolicyItem(polyBizSjnm: "청년 주거지원 사업",
                   progress: "proceed",
                   bizPrdCn: "2023.01.01 ~ 2024.05.31",
                   remainDate: "D-182",
                   polyCategory: "주거분야"),
        PolicyItem(polyBizSjnm: "청년 도약 계좌",
                   progress: "deadline",
                   bizPrdCn: "2023.01.01 ~ 2023.05.31",
                   remainDate: "D-0",
                   polyCategory: "주거분야"),
    ]
    
}


enum TabType {
    case hot
    case like
    case recommand
}

struct PolicyItem {
    var sequenceNumber: Int?
    var polyBizSjnm: String
    var progress: String
    var bizPrdCn: String
    var remainDate: String
    var polyCategory: String
}
