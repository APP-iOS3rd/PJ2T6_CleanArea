//
//  MainView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Query var youthPolicies: [YouthPolicy]
    @State private var selectedTab = "Home"
    var vm: StartVM?
    @StateObject var network = APIViewModel()
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            if let info = network.result {
                TabView(selection: $selectedTab) {
                    RecommandView(apiViewModel: network)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag("Home")
                    
                    ListView(youthPolicies: info, tabType: .hot)
                        .tabItem {
                            Label("Hot", systemImage: "flame")
                        }
                        .tag("Hot")
                    
                    ListView(youthPolicies: youthPolicies, tabType: .like)
                        .tabItem {
                            Label("Like", systemImage: "star")
                        }
                        .tag("Like")
                }
                .accentColor(.buttonGreen)
            } else {
                Text("로딩중")
            }
        }
        .onAppear() {
            if let vm = self.vm {
                network.search(vm: vm)
            }
        }
    }
}

#Preview {
    MainView()
}
