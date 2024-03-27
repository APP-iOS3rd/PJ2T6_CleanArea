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
        var policies: [YouthPolicy]
        var recommandPolicies : [YouthPolicy] = []
        var hotPolicies: [YouthPolicy] = []
        var likePolicies: [YouthPolicy] = []

        var text = ""
    }
    
    enum Action {
        case setFilterPolicy

    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .setFilterPolicy:
                state.hotPolicies = state.policies.sorted { $0.views > $1.views }
                state.likePolicies = state.likePolicies
                state.recommandPolicies = state.policies.filter { policy in
                    state.text.isEmpty || policy.polyBizSjnm.localizedCaseInsensitiveContains(state.text)
                    
                }
                return .none

            }
        }
    }
}

struct MainView: View {
    
    let store: StoreOf<MainFeature>
    
    @Query var youthPolicies: [YouthPolicy]
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            TabView {
                RecommandView(
                    store: Store(initialState: RecommandFeature.State(
                        policies: store.recommandPolicies)) {
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
            store.send(.setFilterPolicy)
        }
    }
}
