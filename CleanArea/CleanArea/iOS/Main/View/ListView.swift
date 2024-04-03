//
//  ListView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import ComposableArchitecture

import SwiftUI

struct ListView: View {
    var store: StoreOf<ListFeature>
    
    var body: some View {
        VStack {

            if store.tabType == .recommand {
                HStack {
                    Button {
                        store.send(.tabBackButton)
                    } label: {
                        Image(systemName: "chevron.left")
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                    }
                    Text(store.hearderTitle)
                        .font(.pretendardBold30)
                        .foregroundStyle(.mainGreen)
                        .padding(.top, 20)
                    Spacer()
                }
                .padding(.horizontal)
                SearchBar(store: store)
                    .padding(.horizontal)
            }
            
            ScrollView {
                ForEach(store.filteredPolicies, id: \.self) { policy in

                    NavigationLink(state: StartFeature.Path.State.detailScene(.init(
                        cityImage: store.residence,
                        youthPolicy: policy)
                    )) {
                        ListItemView(
                            store: Store(
                                initialState: ListItemFeature.State(policy: policy)) {
                                    ListItemFeature()
                                }
                        )
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }

                }
            }
            .scrollContentBackground(.hidden)
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

