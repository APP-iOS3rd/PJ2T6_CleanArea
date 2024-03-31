//
//  ListFeature.swift
//  CleanArea
//
//  Created by 노주영 on 3/29/24.
//

import ComposableArchitecture

import Foundation

@Reducer
struct ListFeature {
    @ObservableState
    struct State: Equatable {
        var policies: IdentifiedArrayOf<YouthPolicy> = []
        var filteredPolicies: IdentifiedArrayOf<YouthPolicy> = []
        var residence: City?
        var tabType: TabType = .recommand
        var hearderTitle: String = ""
        var text: String = ""
    }
    
    enum Action {
        case clearTextField
        case filterPolicies(String)
        case setText(String)
        case tabBackButton
    }
    
    @Dependency(\.dismiss) var dismiss

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .clearTextField:
                state.text = ""
                return .none
            case let .filterPolicies(text):
                if state.text.isEmpty {
                    state.filteredPolicies = state.policies
                } else {
                    state.filteredPolicies = state.policies.filter {
                        $0.polyBizSjnm.localizedCaseInsensitiveContains(text)
                    }
                }
                return .none
                
            case let .setText(text):
                state.text = text
                state.filteredPolicies = []
             
                return .run { send in
                    await send(.filterPolicies(text))
                }
                
            case .tabBackButton:
                return .run { _ in
                    await self.dismiss()
                }
            }
        }
    }
}
