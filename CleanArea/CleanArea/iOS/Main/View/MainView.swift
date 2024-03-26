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
    struct State {
        var youthPolicies: [YouthPolicy]
        var selectedTab = "Home"
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

struct MainView: View {
    @StateObject var vm = APIViewModel()
    
    let store: StoreOf<MainFeature>
    
    @Query var youthPolicies: [YouthPolicy]
    
    @State private var selectedTab = "Home"
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            TabView(selection: $selectedTab) {
                RecommandView(apiViewModel: vm, residence: vm.residence)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag("Home")
                
                ListView(youthPolicies: vm.result ?? [], tabType: .hot, residence: vm.residence)
                    .tabItem {
                        Label("Hot", systemImage: "flame")
                    }
                    .tag("Hot")
                
                ListView(youthPolicies: youthPolicies, tabType: .like, residence: vm.residence)
                    .tabItem {
                        Label("Like", systemImage: "star")
                    }
                    .tag("Like")
            }
            .accentColor(.buttonGreen)
        }
    }
}
