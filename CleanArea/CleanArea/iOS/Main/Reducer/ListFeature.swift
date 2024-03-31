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
        var residence: City?
        var tabType: TabType = .recommand
        var hearderTitle: String = ""
        var text: String = ""
    }
    
    enum Action {
        case clearTextField
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
                
            case let .setText(text):
                state.text = text
                return .none
                
            case .tabBackButton:
                return .run { _ in
                    await self.dismiss()
                }
            }
        }
    }
}
