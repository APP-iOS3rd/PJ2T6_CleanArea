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
        var filteredPolicy : [YouthPolicy] = []
        var policies: [YouthPolicy]
        var likePolicies: [YouthPolicy] = []
        var residence: City?
        var tabType: TabType
        var text: String
    }
    
    enum Action {
        case clearTextField
        case setText(String)
        case setFilterPolicy
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
                
            case .setFilterPolicy:
                switch state.tabType {
                case .hot:
                    // 조회수가 높은 순으로 정렬
                    state.filteredPolicy = state.policies.sorted { $0.views > $1.views }
                case .like:
                    state.filteredPolicy = state.likePolicies
                case .recommand:
                    state.filteredPolicy = state.policies.filter { policy in
                        state.text.isEmpty || policy.polyBizSjnm.localizedCaseInsensitiveContains(state.text)
                    }
                }
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

                List {
                    ForEach(store.filteredPolicy, id: \.self) { policy in
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
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical, 8)
                    }
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
            }
        }
        .onAppear {
            store.send(.setFilterPolicy)
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



