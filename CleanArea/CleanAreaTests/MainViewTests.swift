//
//  MainViewTests.swift
//  CleanAreaTests
//
//  Created by 최동호 on 3/26/24.
//

import ComposableArchitecture

import XCTest
@testable import CleanArea

@MainActor
final class MainViewTests: XCTestCase {
    
    func testSearchFieldTest() async throws {
        let store = TestStore(initialState: SearchFeature.State()) {
            SearchFeature()
        }
        
        await store.send(.setText("파주")) {
            $0.text = "파주"
        }
        
        await store.send(.clearTextField) {
            $0.text = ""
        }
        
  
    }
    
//    func testListItemTests() async throws {
//        let store = TestStore(initialState: ListItemFeature.State(policy: YouthPolicy(bizId: "", polyBizSecd: "", polyBizTy: "", polyBizSjnm: "", polyItcnCn: "", sporCn: "", sporScvl: "", bizPrdCn: "2024.03.27", prdRpttSecd: "", rqutPrdCn: "", ageInfo: "", majrRqisCn: "", empmSttsCn: "", splzRlmRqisCn: "", accrRqisCn: "", prcpCn: "", aditRscn: "", prcpLmttTrgtCn: "", rqutProcCn: "", pstnPaprCn: "", jdgnPresCn: "", rqutUrla: "", rfcSiteUrla1: "", rfcSiteUrla2: "", mngtMson: "", mngtMrofCherCn: "", cherCtpcCn: "", cnsgNmor: "", tintCherCn: "", tintCherCtpcCn: "", etct: "", polyRlmCd: "", minAge: "", maxAge: "", startDate: "", endDate: "", views: 0), dDayText: "")) {
//            ListItemFeature()
//        }
//        
//        await store.send(.appearSet(.init(bizId: "", polyBizSecd: "", polyBizTy: "", polyBizSjnm: "", polyItcnCn: "", sporCn: "", sporScvl: "", bizPrdCn: "2024.03.27", prdRpttSecd: "", rqutPrdCn: "", ageInfo: "", majrRqisCn: "", empmSttsCn: "", splzRlmRqisCn: "", accrRqisCn: "", prcpCn: "", aditRscn: "", prcpLmttTrgtCn: "", rqutProcCn: "", pstnPaprCn: "", jdgnPresCn: "", rqutUrla: "", rfcSiteUrla1: "", rfcSiteUrla2: "", mngtMson: "", mngtMrofCherCn: "", cherCtpcCn: "", cnsgNmor: "", tintCherCn: "", tintCherCtpcCn: "", etct: "", polyRlmCd: "", minAge: "", maxAge: "", startDate: "", endDate: "", views: 0)))
//
//        
//        
//    }
    
}
