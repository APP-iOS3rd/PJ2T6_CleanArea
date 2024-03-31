//
//  RecommandFeature.swift
//  CleanArea
//
//  Created by 최동호 on 3/31/24.
//

import ComposableArchitecture

import Foundation

@Reducer
struct RecommandFeature {
    @ObservableState
    struct State: Equatable {
        var recommandcellModels: [RecommandCellModel] = []
    }
    
    enum Action {
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
