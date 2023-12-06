//
//  APIModel.swift
//  CleanArea
//
//  Created by 김지훈 on 2023/12/06.
//

import Foundation

//받아올 데이터
struct YouthPolicyList {
    var pageIndex: Int
    var totalCnt: Int
    var youthPolicies: [YouthPolicy]
}

struct YouthPolicy: Identifiable {
    let id = UUID()
    
    var rnum: Int
    var polyBizTy: String                           //정책 ID
    var polyBizSjnm: String                         //정책명
    var rqutUrla: String                            //신청 사이트 주소
}
