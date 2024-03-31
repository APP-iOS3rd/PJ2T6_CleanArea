//
//  MainFeature.swift
//  CleanArea
//
//  Created by 노주영 on 3/29/24.
//

import ComposableArchitecture

import Foundation

@Reducer
struct MainFeature {
    @ObservableState
    struct State: Equatable {
        var policies: IdentifiedArrayOf<YouthPolicy> = [YouthPolicy(bizId: "R2023091517284",
                                                                    polyBizSecd: "003002008006",
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
                                                                    views: 12)]
        var hotPolicies: IdentifiedArrayOf<YouthPolicy> = []
        var initialAppear: Bool = true
        var likePolicies: IdentifiedArrayOf<YouthPolicy> = []
        var recommandcellModels: [RecommandCellModel] = []
        
        mutating func fetchItems() {
            @Dependency(\.swiftData) var swiftData
            do {
                self.likePolicies = IdentifiedArray(uniqueElements: try swiftData.fetch())
            } catch {
                print("error :: fetchItems", error.localizedDescription)
            }
        }
    }
    
    enum Action {
        case appearSet
        case filterPolicy(IdentifiedArrayOf<YouthPolicy>, Field)
        case getPolicy
        case initialAppear
        case setFilterPolicy
        case setRecommanModel(IdentifiedArrayOf<YouthPolicy>, String)
        case tabBackButton

    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.swiftData) var swiftData

    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .appearSet:
                return .run { [initialAppear = state.initialAppear] send in
                    if initialAppear {
                        await send(.setFilterPolicy)
                        await send(.getPolicy)
                        await send(.initialAppear)
                    }
                }
                
            case let .filterPolicy(policies, code):
                switch code {
                case .job:
                    let job = policies.filter {  $0.polyRlmCd == code.rawValue }
                    return .run { send in
                        await send(.setRecommanModel(job, "일자리"))
                    }
                case .residence:
                    let residence = policies.filter {  $0.polyRlmCd == code.rawValue }
                    return .run { send in
                        await send(.setRecommanModel(residence, "주거"))
                    }
                case .education:
                    let education = policies.filter {  $0.polyRlmCd == code.rawValue }
                    return .run { send in
                        await send(.setRecommanModel(education, "교육"))
                    }
                case .curture:
                    let curture = policies.filter {  $0.polyRlmCd == code.rawValue }
                    return .run { send in
                        await send(.setRecommanModel(curture, "복지, 문화"))
                    }
                case .participation:
                    let participation = policies.filter {  $0.polyRlmCd == code.rawValue }
                    return .run { send in
                        await send(.setRecommanModel(participation, "참여, 권리"))
                    }
                }
                
            case .getPolicy:
                let policies = state.policies
                return .concatenate([
                    .run { send in
                        await send(.filterPolicy(policies, Field.job))
                    },
                    .run { send in
                        await send(.filterPolicy(policies, Field.residence))
                    },
                    .run { send in
                        await send(.filterPolicy(policies, Field.education))
                    },
                    .run { send in
                        await send(.filterPolicy(policies, Field.curture))
                    },
                    .run { send in
                        await send(.filterPolicy(policies, Field.participation))
                    }
                ])
            case .initialAppear:
                state.initialAppear = false
                return .none
                
            case .setFilterPolicy:
                state.hotPolicies = IdentifiedArrayOf<YouthPolicy>( uniqueElements: state.policies.sorted { $0.views > $1.views })
                state.likePolicies = state.likePolicies
                return .none
                
            case let .setRecommanModel(policies, name):
                let cellModel =  RecommandCellModel(name: name, count: policies.count, destinationKey: name, policies: policies)
                state.recommandcellModels.append(cellModel)
                return .none
                
            case .tabBackButton:
                return .run { _ in
                    await self.dismiss()
                }
            }
            
        }
    }
}
