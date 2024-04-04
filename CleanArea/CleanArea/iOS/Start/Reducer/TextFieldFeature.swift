//
//  TextFieldFeature.swift
//  CleanArea
//
//  Created by 최동호 on 3/25/24.
//

import ComposableArchitecture

import Foundation

@Reducer
struct TextFieldFeature {
    @ObservableState
    struct State: Equatable {
        var text: String = ""
        var type: TextFieldType = .residence
        var width: Int = 0
    }
    
    enum Action {
        case selectText(String)
        case setName(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .selectText(text):
                state.text = text
                return .none
                
            case let .setName(text):
                state.text = text
                return .none
            }
        }
    }
}
