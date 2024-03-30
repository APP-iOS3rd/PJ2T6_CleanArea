//
//  TestView.swift
//  CleanArea
//
//  Created by 노주영 on 3/29/24.
//

import SwiftUI

import ComposableArchitecture

import Foundation

@Reducer
struct FinalFeature {
    @ObservableState
    struct State: Equatable {
        var text: String = ""
    }
    
    enum Action {
        case initialAppear
        case tabButton
        case finalButton
        
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .initialAppear:
                print("바이")
                return .none
                
            case .tabButton:
                return .run { _ in
                    await self.dismiss()
                }
                
            case .finalButton:
                print("1234123")
                return .none
            }
        }
    }
}


struct FinalView: View {
    var store: StoreOf<FinalFeature>
    
    var body: some View {
        VStack {
            Button(action: {
                store.send(.tabButton)
            }, label: {
                Text("뒤로")
            })
            
            
            Button(action: {
                store.send(.finalButton)
            }, label: {
                Text("앞으로")
            })
        }
        .onAppear(perform: {
            store.send(.initialAppear)
        })
    }
}


