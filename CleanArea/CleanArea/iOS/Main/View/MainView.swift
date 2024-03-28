//
//  MainView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import ComposableArchitecture

import SwiftUI
import SwiftData

@Reducer
struct MainFeature {
    @ObservableState
    struct State: Equatable {
        var policies: IdentifiedArrayOf<YouthPolicy> = []
        var hotPolicies: IdentifiedArrayOf<YouthPolicy> = []
        var likePolicies: IdentifiedArrayOf<YouthPolicy> = []
        
        var recommandcellModels: [RecommandCellModel] = []
        
        var job: IdentifiedArrayOf<YouthPolicy> = []
        var residence: IdentifiedArrayOf<YouthPolicy> = []
        var education: IdentifiedArrayOf<YouthPolicy> = []
        var curture: IdentifiedArrayOf<YouthPolicy> = []
        var participation: IdentifiedArrayOf<YouthPolicy> = []
    }
    
    enum Action {
        case appearSet
        case distributeModel
        case getPolicy
        case filterPolicy(IdentifiedArrayOf<YouthPolicy>, Field)
        case setFilterPolicy
        case setRecommanModel(IdentifiedArrayOf<YouthPolicy>, String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .appearSet:
                return .run { send in
                    await send(.setFilterPolicy)
                    await send(.getPolicy)
                }
                
            case .distributeModel:
                let job = state.job
                let residence = state.residence
                let education = state.education
                let curture = state.curture
                let participation = state.participation
                
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
                    state.job = policies.filter {  $0.polyRlmCd == code.rawValue }
                    
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

struct MainView: View {
    
    @Bindable var store: StoreOf<MainFeature>
    
    @Query var youthPolicies: [YouthPolicy]
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            TabView {
                RecommandView(
                    store: Store(initialState: RecommandFeature.State(
                        recommandcellModels: store.recommandcellModels)) {
                        RecommandFeature()
                    }
                )
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag("Home")
                
                ListView(
                    store: Store(initialState: ListFeature.State(
                        policies: store.hotPolicies,
                        tabType: .hot,
                        text: "")) {
                            ListFeature()
                        })
                .tabItem {
                    Label("Hot", systemImage: "flame")
                }
                .tag("Hot")
                
                ListView(
                    store: Store(initialState: ListFeature.State(
                        policies: store.likePolicies,
                        tabType: .like,
                        text: "")) {
                            ListFeature()
                        })
                .tabItem {
                    Label("Like", systemImage: "star")
                }
                .tag("Like")
            }
            .accentColor(.buttonGreen)
        }
        .onAppear {
            store.send(.appearSet)
        }
    }
}
