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
struct TestFeature {
    @ObservableState
    struct State: Equatable {
        var text: String = ""
    }
    
    enum Action {
        case initialAppear
        case tabButton
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .initialAppear:
                print("하이")
                return .none
                
            case .tabButton:
                return .run { _ in
                    await self.dismiss()
                }
            }
        }
    }
}


struct TestView: View {
    var store: StoreOf<TestFeature>
    
    var body: some View {
        VStack {
            Button(action: {
                store.send(.tabButton)
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear(perform: {
            store.send(.initialAppear)
        })
    }
}

