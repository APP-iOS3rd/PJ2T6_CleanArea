//
//  ListVM.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import Foundation

let popularPolicyItems = [
    PolicyItem(sequenceNumber: 1,
               polyBizSjnm: "국민취업지원제도",
               bizPrdCn: "2023.01.01 ~ 2024.01.31",
               polyCategory: "교육분야"),
    PolicyItem(sequenceNumber: 2,
               polyBizSjnm: "서울 안심주택 지원제도",
               bizPrdCn: "",
               polyCategory: "주거분야"),
    PolicyItem(sequenceNumber: 3,
               polyBizSjnm: "청년도전사업",
               bizPrdCn: "2023.01.01 ~ 2023.05.31",
               polyCategory: "교육분야"),
    PolicyItem(sequenceNumber: 4,
               polyBizSjnm: "청년 일자리 도약 지원금",
               bizPrdCn: "2023.01.01 ~ 2024.05.31",
               polyCategory: "일자리분야")
]


let likePolicyItems = [
    PolicyItem(polyBizSjnm: "국민취업지원제도",
               bizPrdCn: "2023.01.01 ~ 2024.01.31",
               polyCategory: "교육분야"),
    PolicyItem(polyBizSjnm: "서울 안심주택 지원제도",
               bizPrdCn: "",
               polyCategory: "주거분야"),
    PolicyItem(polyBizSjnm: "청년도전사업",
               bizPrdCn: "2023.01.01 ~ 2023.05.31",
               polyCategory: "교육분야"),
    PolicyItem(polyBizSjnm: "청년 일자리 도약 지원금",
               bizPrdCn: "2023.01.01 ~ 2024.05.31",
               polyCategory: "일자리분야")
]

let recommandPolicyItems = [
    PolicyItem(polyBizSjnm: "청년 월세지원정책",
               bizPrdCn: "2023.01.01 ~ 2024.01.31",
               polyCategory: "주거분야"),
    PolicyItem(polyBizSjnm: "서울시 청년 안심주택",
               bizPrdCn: "",
               polyCategory: "주거분야"),
    PolicyItem(polyBizSjnm: "청년내일저축계좌",
               bizPrdCn: "2023.01.01 ~ 2023.05.31",
               polyCategory: "주거분야"),
    PolicyItem(polyBizSjnm: "청년 주거지원 사업",
               bizPrdCn: "2023.01.01 ~ 2024.05.31",
               polyCategory: "주거분야"),
    PolicyItem(polyBizSjnm: "청년 도약 계좌",
               bizPrdCn: "2023.01.01 ~ 2023.05.31",
               polyCategory: "주거분야"),
]

struct PolicyItem {
    var sequenceNumber: Int?
    var polyBizSjnm: String
    var bizPrdCn: String
    var polyCategory: String
}
