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
struct TestTwoFeature {
    @ObservableState
    struct State: Equatable {
        var text: String = ""
    }
    
    enum Action {
        case initialAppear
        case tabButton
        case removeAll
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
                
            case .removeAll:
            
                return .none
            }
        }
    }
}

struct TestTwoView: View {
    @Bindable var store: StoreOf<TestTwoFeature>
    
    var body: some View {
            VStack {
                Button(action: {
                    store.send(.tabButton)
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                
                Button(action: {
                    store.send(.removeAll)
                }, label: {
                    Text("home")
                })
            }
            .onAppear(perform: {
                store.send(.initialAppear)
            })
    }
}

