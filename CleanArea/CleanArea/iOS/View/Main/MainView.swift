//
//  MainView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject var vm = APIViewModel()
    
    @Query var youthPolicies: [YouthPolicy]
    
    @State private var selectedTab = "Home"
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            switch vm.result {
            case .some(let info):
                TabView(selection: $selectedTab) {
                    RecommandView(apiViewModel: vm, residence: vm.residence)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag("Home")
                    
                    ListView(youthPolicies: info, tabType: .hot, residence: vm.residence)
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
                
            case .none:
                LoadingCircleView()
            }
        }
        .onAppear() {
            vm.search()
        }
    }
}
