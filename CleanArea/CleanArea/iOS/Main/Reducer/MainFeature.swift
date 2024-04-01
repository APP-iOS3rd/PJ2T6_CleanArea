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
