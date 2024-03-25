//
//  StartViewTests.swift
//  CleanAreaTests
//
//  Created by 최동호 on 3/25/24.
//
import ComposableArchitecture

import XCTest
@testable import CleanArea

final class StartViewTests: XCTestCase {
    
    func textFieldTest() async {
        let store = TestStore(initialState: TextFieldFeature.State(text: "", type: TextFieldType.educationLevel, width: 300)) {
            TextFieldFeature()
        }
        
        await store.send(.selectText("hi")) {
            $0.text = "hi"
        }
        
        await store.send(.setName("hello")) {
            $0.text = "hello"
        }
    }
    
    func locationFieldTest() async {
        let store = TestStore(initialState: LocationFeature.State(width: 300)) {
            LocationFeature()
        }
        
        await store.send(.toggleModal) {
            $0.showModal = true
        }
        
        await store.send(.selectCity(.경기도)) {
            $0.selectedCity = .경기도
        }
        
        await store.send(.setCity) {
            $0.city = .경기도
            $0.showModal = false
        }
    }
    
    func startFeatureTest() async {
        let store = TestStore(initialState: StartFeature.State()) {
            StartFeature()
        }
//    withDependencies: {
//            $0.searchResult.fetch = { [YouthPolicy(bizId: "R2023060213185", polyBizSecd: "", polyBizTy: "", polyBizSjnm: "", polyItcnCn: "", sporCn: "", sporScvl: "", bizPrdCn: "", prdRpttSecd: "", rqutPrdCn: "", ageInfo: "", majrRqisCn: "", empmSttsCn: "", splzRlmRqisCn: "", accrRqisCn: "", prcpCn: "", aditRscn: "", prcpLmttTrgtCn: "", rqutProcCn: "", pstnPaprCn: "", jdgnPresCn: "", rqutUrla: "", rfcSiteUrla1: "", rfcSiteUrla2: "", mngtMson: "", mngtMrofCherCn: "", cherCtpcCn: "", cnsgNmor: "", tintCherCn: "", tintCherCtpcCn: "", etct: "", polyRlmCd: "", minAge: "", maxAge: "", startDate: "", endDate: "", views: 0)] }
//        }
        
        await store.send(.searchButtonTap(City.고양시, "", "", "", "")) {
            $0.viewType = .loading
        }
        
        await store.receive(\.dataResponse) {
            $0.viewType = .startView
//            $0.result = [YouthPolicy(bizId: "R2023060213185", polyBizSecd: "", polyBizTy: "", polyBizSjnm: "", polyItcnCn: "", sporCn: "", sporScvl: "", bizPrdCn: "", prdRpttSecd: "", rqutPrdCn: "", ageInfo: "", majrRqisCn: "", empmSttsCn: "", splzRlmRqisCn: "", accrRqisCn: "", prcpCn: "", aditRscn: "", prcpLmttTrgtCn: "", rqutProcCn: "", pstnPaprCn: "", jdgnPresCn: "", rqutUrla: "", rfcSiteUrla1: "", rfcSiteUrla2: "", mngtMson: "", mngtMrofCherCn: "", cherCtpcCn: "", cnsgNmor: "", tintCherCn: "", tintCherCtpcCn: "", etct: "", polyRlmCd: "", minAge: "", maxAge: "", startDate: "", endDate: "", views: 0)]
        }
        
        await store.send(.openMain) {
            $0.viewType = .startView
            $0.openMain = true
        }
    }

}
