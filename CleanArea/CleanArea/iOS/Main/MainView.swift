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
            VStack{

                HStack {
                    if selectedTab == "Home" {
                        Text("추천정책")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                        Spacer()
                    } else if selectedTab == "Hot" {
                        Text("인기정책")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                        Spacer()
                    } else if selectedTab == "Like" {
                        Text("즐겨찾기")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                        Spacer()
                    }
                }
                .frame(width: 330)
                .padding()
                
                TabView(selection: $selectedTab) {
                    RecommandView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag("Home")
                    
                    ListView(tabType: .hot)
                        .tabItem {
                            Label("Hot", systemImage: "flame")
                        }
                        .tag("Hot")
                    
                    ListView(tabType: .like)
                        .tabItem {
                            Label("Like", systemImage: "star")
                        }
                        .tag("Like")
                }
                .accentColor(.buttonGreen)
            }
        }
    }
}

#Preview {
    MainView()
}
