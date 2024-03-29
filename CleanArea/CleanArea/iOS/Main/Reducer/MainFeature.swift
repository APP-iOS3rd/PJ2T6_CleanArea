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
        var policies: IdentifiedArrayOf<YouthPolicy> = []
        
        var hotPolicies: IdentifiedArrayOf<YouthPolicy> = []
        var likePolicies: IdentifiedArrayOf<YouthPolicy> = []
        
        var job: IdentifiedArrayOf<YouthPolicy> = []
        var residence: IdentifiedArrayOf<YouthPolicy> = []
        var education: IdentifiedArrayOf<YouthPolicy> = []
        var curture: IdentifiedArrayOf<YouthPolicy> = []
        var participation: IdentifiedArrayOf<YouthPolicy> = []
        
        var recommandcellModels: [RecommandCellModel] = []
        
        var initialApear: Bool = false
    }
    
    enum Action {
        case appearSet
        case distributeModel
        case filterPolicy(IdentifiedArrayOf<YouthPolicy>, Field)
        case getPolicy
        case setFilterPolicy
        case setRecommanModel(IdentifiedArrayOf<YouthPolicy>, String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .appearSet:
                return .run { [initialApear = state.initialApear] send in
                    if initialApear {
                        await send(.setFilterPolicy)
                        await send(.getPolicy)
                    }
                }
                
            case .distributeModel:
                state.initialApear = false
                
                return .concatenate([
                    .run { [job = state.job] send in
                        await send(.setRecommanModel(job, "일자리"))
                    },
                    .run { [residence = state.residence] send in
                        await send(.setRecommanModel(residence, "주거"))
                    },
                    .run { [education = state.education] send in
                        await send(.setRecommanModel(education, "교육"))
                    },
                    .run { [curture = state.curture] send in
                        await send(.setRecommanModel(curture, "복지, 문화"))
                    },
                    .run { [participation = state.participation] send in
                        await send(.setRecommanModel(participation, "참여, 권리"))
                    }
                ])
                
            case let .filterPolicy(policies, code):
                switch code {
                case .job:
                    let job = policies.filter {  $0.polyRlmCd == code.rawValue }
                    
                case .residence:
                    state.residence = policies.filter {  $0.polyRlmCd == code.rawValue }
                    
                case .education:
                    state.education = policies.filter {  $0.polyRlmCd == code.rawValue }
                    
                case .curture:
                    state.curture = policies.filter {  $0.polyRlmCd == code.rawValue }
                    
                case .participation:
                    state.participation = policies.filter {  $0.polyRlmCd == code.rawValue }
                }
                return .none
                
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
                    },
                    .run { send in
                        await send(.distributeModel)
                    }
                ])
                
            case .setFilterPolicy:
                state.hotPolicies = IdentifiedArrayOf<YouthPolicy>( uniqueElements: state.policies.sorted { $0.views > $1.views })
                state.likePolicies = state.likePolicies
                return .none
                
            case let .setRecommanModel(policies, name):
                let cellModel =  RecommandCellModel(name: name, count: policies.count, destinationKey: name, policies: policies)
                state.recommandcellModels.append(cellModel)
                return .none
            }
        }
    }
}
