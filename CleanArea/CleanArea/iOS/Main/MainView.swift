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

            switch network.result {
            case .some(let info):
                TabView(selection: $selectedTab) {
                    RecommandView(apiViewModel: network, residence: vm?.residence)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag("Home")

                    ListView(youthPolicies: info, tabType: .hot, residence: vm?.residence)
                        .tabItem {
                            Label("Hot", systemImage: "flame")
                        }
                        .tag("Hot")

                    ListView(youthPolicies: youthPolicies, tabType: .like, residence: vm?.residence)
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
            if let vm = self.vm {
                network.search(vm: vm)
            }
        }
    }
}

#Preview {
    MainView()
}
