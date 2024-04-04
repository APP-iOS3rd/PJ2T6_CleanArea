//
//  StartViewTests.swift
//  CleanAreaTests
//
//  Created by 최동호 on 3/25/24.
//

import ComposableArchitecture

import XCTest
@testable import CleanArea

@MainActor
final class StartViewTests: XCTestCase {
    
    func testTextField() async {
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
    
    func testLocationField() async {
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
        }
        
        await store.receive(\.toggleModal) {
            $0.showModal = false
        }
    }
    
    func testKeyboard() async {
        let store = TestStore(initialState: StartFeature.State()) {
            StartFeature()
        }
        
        await store.send(.keyboardUp) {
            $0.isKeyboardViewUp = true
        }
        
        await store.send(.keyboardDown) {
            $0.isKeyboardViewUp = false
        }
    }
    
    func testStartFeature() async {
        
        let store = TestStore(initialState: StartFeature.State()) {
            StartFeature()
        } withDependencies: {
            $0.searchResult.fetch = { _ in
                [.init(
                    bizId: "R2023091517284",
                    polyBizSecd: "003002008010",
                    polyBizTy: "지자체",
                    polyBizSjnm: "수영구 청년 및 신혼부부 주거자금 대출이자 지원사업",
                    polyItcnCn: "취업, 결혼, 출산 등 미래 준비에 대한 디딤돌 역할과 청년층 삶의 질 제고 및 안정된 정주여건을 조성하기 위한 주거자금 대출이자 지원 사업임",
                    sporCn: "구입, 전월세 목적으로 금융권 대출을 실행한 대출 잔액의 1%, 가구당 100만 원 이내에서 지원(매년 1회 신청·접수, 회차당 50만 원까지 지원",
                    sporScvl: "100가구",
                    bizPrdCn: "2023.08.21.~2023.09.08.",
                    prdRpttSecd: "002004",
                    rqutPrdCn: "2023.08.21.~2023.09.08.",
                    ageInfo: "제한없음",
                    majrRqisCn: "-",
                    empmSttsCn: "-",
                    splzRlmRqisCn: "-",
                    accrRqisCn: "-",
                    prcpCn: "구입, 전월세 목적으로 금융권 대출을 실행한 청년 및 신혼부부 가구① 청년 유형 - 미혼인 19~34세의 청년 또는 혼인신고 7년 초과인 기혼 청년 - 연속해서 1년 이상 수영구에 주민등록 - 대출을 실행한 주택의 주소지에 등본상 거주 - 2022년 소득금액증명원 기준 연 소득 4천만 원 이하 - 전국 기준 무주택자 (주택 구입의 경우 수영구 내 1주택(거주용) 허용) - 2022. 12. 31. 이전 '주택, 임차, 전세' 등 주거 자금 대출을 받은 자② 신혼부부 유형 - 부부 중 신청자 19~34세의 청년 (혼인신고 7년 이내) - 부부 모두 연속해서 1년 이상 수영구에 주민등록 - 대출을 실행한 주택의 주소지에 등본상 부부 중 한 명 이상 거주 - 2022년 소득금액증명원 기준 연 소득 7천만 원 이하 (부부합산) - 2022. 12. 31. 이전 '주택, 임차, 전세' 등 주거 자금 대출을 받은 자",
                    aditRscn: "-",
                    prcpLmttTrgtCn: "·국민기초생활수급자(생계, 의료, 주거급여 수급자)·대출 용도가 주거자금이 아닌 자(일반, 신용대출, 마이너스대출 등)·공공임대주택(국민임대, 영구임대, 매입임대, 전세임대, 행복주택 등) 거주자·건축물대장상 불법건축물 등 주택이 아닌 곳(예외 : 주거용 오피스텔)·신청인 및 배우자의 직계존비속(신청인의 배우자 포함)과 주택 거래 계약을 체결한 경우·본인 명의의 통장 입출금 거래가 불가능한 자·기타 사업 취지에 부합하지 않다고 판단되는 경우",
                    rqutProcCn: "-",
                    pstnPaprCn: "수영구청 청년포털 홈페이지 공고문 참조",
                    jdgnPresCn: "-",
                    rqutUrla: "-",
                    rfcSiteUrla1: "-",
                    rfcSiteUrla2: "-",
                    mngtMson: "부산시 수영구청 일자리경제과",
                    mngtMrofCherCn: "박태훈",
                    cherCtpcCn: "051-610-4827",
                    cnsgNmor: "수영구청 일자리경제과",
                    tintCherCn: "-",
                    tintCherCtpcCn: "-",
                    etct: "-",
                    polyRlmCd: "023020",
                    minAge: "0",
                    maxAge: "100",
                    startDate: "2023.8.21",
                    endDate: "2023.9.8",
                    views: 12
                )]
            }
        }

        await store.send(.searchButtonTap(City.고양시, "", "", "", "")) {
            $0.viewType = .loading
        }
        
        await store.receive(\.dataResponse) {
            $0.viewType = .loading
            $0.result = [.init(
                bizId: "R2023091517284",
                polyBizSecd: "003002008010",
                polyBizTy: "지자체",
                polyBizSjnm: "수영구 청년 및 신혼부부 주거자금 대출이자 지원사업",
                polyItcnCn: "취업, 결혼, 출산 등 미래 준비에 대한 디딤돌 역할과 청년층 삶의 질 제고 및 안정된 정주여건을 조성하기 위한 주거자금 대출이자 지원 사업임",
                sporCn: "구입, 전월세 목적으로 금융권 대출을 실행한 대출 잔액의 1%, 가구당 100만 원 이내에서 지원(매년 1회 신청·접수, 회차당 50만 원까지 지원",
                sporScvl: "100가구",
                bizPrdCn: "2023.08.21.~2023.09.08.",
                prdRpttSecd: "002004",
                rqutPrdCn: "2023.08.21.~2023.09.08.",
                ageInfo: "제한없음",
                majrRqisCn: "-",
                empmSttsCn: "-",
                splzRlmRqisCn: "-",
                accrRqisCn: "-",
                prcpCn: "구입, 전월세 목적으로 금융권 대출을 실행한 청년 및 신혼부부 가구① 청년 유형 - 미혼인 19~34세의 청년 또는 혼인신고 7년 초과인 기혼 청년 - 연속해서 1년 이상 수영구에 주민등록 - 대출을 실행한 주택의 주소지에 등본상 거주 - 2022년 소득금액증명원 기준 연 소득 4천만 원 이하 - 전국 기준 무주택자 (주택 구입의 경우 수영구 내 1주택(거주용) 허용) - 2022. 12. 31. 이전 '주택, 임차, 전세' 등 주거 자금 대출을 받은 자② 신혼부부 유형 - 부부 중 신청자 19~34세의 청년 (혼인신고 7년 이내) - 부부 모두 연속해서 1년 이상 수영구에 주민등록 - 대출을 실행한 주택의 주소지에 등본상 부부 중 한 명 이상 거주 - 2022년 소득금액증명원 기준 연 소득 7천만 원 이하 (부부합산) - 2022. 12. 31. 이전 '주택, 임차, 전세' 등 주거 자금 대출을 받은 자",
                aditRscn: "-",
                prcpLmttTrgtCn: "·국민기초생활수급자(생계, 의료, 주거급여 수급자)·대출 용도가 주거자금이 아닌 자(일반, 신용대출, 마이너스대출 등)·공공임대주택(국민임대, 영구임대, 매입임대, 전세임대, 행복주택 등) 거주자·건축물대장상 불법건축물 등 주택이 아닌 곳(예외 : 주거용 오피스텔)·신청인 및 배우자의 직계존비속(신청인의 배우자 포함)과 주택 거래 계약을 체결한 경우·본인 명의의 통장 입출금 거래가 불가능한 자·기타 사업 취지에 부합하지 않다고 판단되는 경우",
                rqutProcCn: "-",
                pstnPaprCn: "수영구청 청년포털 홈페이지 공고문 참조",
                jdgnPresCn: "-",
                rqutUrla: "-",
                rfcSiteUrla1: "-",
                rfcSiteUrla2: "-",
                mngtMson: "부산시 수영구청 일자리경제과",
                mngtMrofCherCn: "박태훈",
                cherCtpcCn: "051-610-4827",
                cnsgNmor: "수영구청 일자리경제과",
                tintCherCn: "-",
                tintCherCtpcCn: "-",
                etct: "-",
                polyRlmCd: "023020",
                minAge: "0",
                maxAge: "100",
                startDate: "2023.8.21",
                endDate: "2023.9.8",
                views: 12
            )]
        }
        
        await store.receive(\.openMain) {
            $0.viewType = .startView
            
            $0.path[id: 0] = .mainScene(MainFeature.State(
                policies: $0.result
            ))
        }
    }
}
