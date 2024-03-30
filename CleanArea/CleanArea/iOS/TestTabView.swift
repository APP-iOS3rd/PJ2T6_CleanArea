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
struct TestTabFeature {
    @ObservableState
    struct State: Equatable {
        var text: String = ""
    }
    
    enum Action {
        case initialAppear
        case tabButton
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .initialAppear:
                print("바이")
                return .none
                
            case .tabButton:
                return .none
            }
        }
    }
}

struct TestTabView: View {
    @Bindable var store: StoreOf<TestTabFeature>
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            TabView {
                TestView(
                    store: Store(initialState: TestFeature.State()) {
                        TestFeature()
                    }
                )
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag("Home")
                
                TestView(
                    store: Store(initialState: TestFeature.State()) {
                        TestFeature()
                    }
                )
                .tabItem {
                    Label("Hot", systemImage: "flame")
                }
                .tag("Hot")
            }
            .accentColor(.buttonGreen)
        }
    }
}
