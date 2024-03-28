//
//  ListView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import ComposableArchitecture

import SwiftData
import SwiftUI

@Reducer
struct ListFeature {
    @ObservableState
    struct State: Equatable {
        var policies: IdentifiedArrayOf<YouthPolicy>
        var residence: City?
        var tabType: TabType
        var text: String
    }
    
    enum Action {
        case clearTextField
        case setText(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .clearTextField:
                state.text = ""
                return .none
                
            case let .setText(text):
                state.text = text
                return .none
                
            }
        }
    }
}

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
                        ZStack(alignment: .leading) {
                            ListItemView(
                                store: Store(
                                    initialState: ListItemFeature.State(policy: policy)) {
                                    ListItemFeature()
                                }
                            )
                            NavigationLink(destination: DetailView(cityImage: store.residence, youthPolicy: policy)) {
                                EmptyView()
                            }
                            .opacity(0)
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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



