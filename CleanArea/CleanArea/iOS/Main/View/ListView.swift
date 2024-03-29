//
//  ListView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import ComposableArchitecture

import SwiftData
import SwiftUI

struct ListView: View {
    var store: StoreOf<ListFeature>
        
    var body: some View {
        NavigationStack {
            VStack {
                switch store.tabType {
                case .hot, .like:
                    HeaderView(
                        store: Store(
                            initialState: HeaderFeature.State(title: store.tabType == .hot ? "인기정책" : "즐겨찾기")) {
                            HeaderFeature()
                        }
                    )
                    
                case .recommand:
                    SearchBar(store: store)
                        .padding(.horizontal)
                }

                ScrollView {
                    ForEach(store.policies, id: \.self) { policy in
                        NavigationLink {
                            DetailView(cityImage: store.residence, youthPolicy: policy)
                        } label: {
                            ListItemView(
                                store: Store(
                                    initialState: ListItemFeature.State(policy: policy)) {
                                    ListItemFeature()
                                }
                            )
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}
