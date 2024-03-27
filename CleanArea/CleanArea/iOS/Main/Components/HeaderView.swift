//
//  HeaderView.swift
//  CleanArea
//
//  Created by 김건호 on 12/12/23.
//

import ComposableArchitecture

import SwiftUI

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

struct HeaderView: View {
    let store: StoreOf<HeaderFeature>
    
    var body: some View {
        HStack {
            Button {
                store.send(.tabButton)
            } label: {
                Image(systemName: "chevron.left")
                    .bold()
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 20)
            }
            Text(store.title)
                .font(.pretendardBold30)
                .foregroundStyle(.mainGreen)
                .padding(.top, 20)
            Spacer()
        }
        .padding(.horizontal)
    }
}
