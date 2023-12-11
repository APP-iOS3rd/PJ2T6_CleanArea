//
//  MainView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "Home"
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
                
                TabView(selection: $selectedTab) {
                    RecommandView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag("Home")
                    
                    ListView(policyItems: popularPolicyItems, tabType: .hot)
                        .tabItem {
                            Label("Hot", systemImage: "flame")
                        }
                        .tag("Hot")
                    
                    ListView(policyItems: likePolicyItems, tabType: .like)
                        .tabItem {
                            Label("Like", systemImage: "star")
                        }
                        .tag("Like")
                }
                .accentColor(.buttonGreen)
            
        }
    }
}

#Preview {
    MainView()
}
