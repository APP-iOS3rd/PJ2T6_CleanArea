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
        VStack {
            HeaderView(
                store: Store(
                    initialState: HeaderFeature.State(title: store.hearderTitle)) {
                        HeaderFeature()
                    }
            )
            if store.tabType == .recommand {
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}
