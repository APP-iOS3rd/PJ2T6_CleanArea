//
//  SearchFeature.swift
//  CleanArea
//
//  Created by 최동호 on 3/26/24.
//

import ComposableArchitecture

import Foundation

@Reducer
struct SearchFeature {
    @ObservableState
    struct State: Equatable {
        var text: String = ""
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
