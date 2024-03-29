//
//  HeaderView.swift
//  CleanArea
//
//  Created by 김건호 on 12/12/23.
//

import ComposableArchitecture

import SwiftUI

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
