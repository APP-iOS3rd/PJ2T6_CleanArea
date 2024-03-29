//
//  HeaderFeature.swift
//  CleanArea
//
//  Created by 노주영 on 3/29/24.
//

import ComposableArchitecture

import Foundation

@Reducer
struct HeaderFeature {
    @ObservableState
    struct State: Equatable {
        let title: String
    }
    
    enum Action {
        case tabButton
    }
    
    @Dependency(\.dismiss) var dismiss

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .tabButton:
                return .run { _ in
                    await self.dismiss()
                }
            }
        }
    }
}
