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
        var youthPolicies: [YouthPolicy]
        
        var tab1 = RecommandFeature.State()
//        var tab2 = ListFeature.State(tabType: .hot, text: "")
//        var tab3 = ListFeature.State(tabType: .like, text: "")
    }
    
    enum Action {
        case tab1(RecommandFeature.Action)
//        case tab2(ListFeature.Action)
//        case tab3(ListFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.tab1, action: \.tab1) {
            RecommandFeature()
           }
//        Scope(state: \.tab2, action: \.tab2) {
//            ListFeature()
//           }
//        Scope(state: \.tab3, action: \.tab3) {
//            ListFeature()
//           }

        Reduce { state, action in
            return .none
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
                RecommandView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag("Home")
                
                ListView(store: Store(initialState: ListFeature.State(policies: store.youthPolicies,
                                                                      tabType: .hot,
                                                                      text: "")) {
                    ListFeature()
                })
                    .tabItem {
                        Label("Hot", systemImage: "flame")
                    }
                    .tag("Hot")
                
                ListView(store: Store(initialState: ListFeature.State(policies: store.youthPolicies,
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
    }
}
