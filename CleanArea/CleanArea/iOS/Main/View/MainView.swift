//
//  MainView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import ComposableArchitecture

import SwiftUI
import SwiftData

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
                        hearderTitle: "인기정책",
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
                        hearderTitle: "즐겨찾기",
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
