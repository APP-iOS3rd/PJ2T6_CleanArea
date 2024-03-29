//
//  SelectCityBox.swift
//  CleanArea
//
//  Created by 노주영 on 3/29/24.
//

import ComposableArchitecture

import SwiftUI

struct SelectCityBox: View {
    @Bindable var store: StoreOf<LocationFeature>

    var body: some View {
        Button {
            store.send(.toggleModal)
        } label: {
            HStack {
                Text(store.city?.getString() ?? "주거지를 선택해 주세요")
                    .foregroundColor((store.city == nil) ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
            }
            .padding()
            .foregroundColor(.gray)
            .background(Color(uiColor: .systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 50)
        .sheet(isPresented: $store.showModal.sending(\.showModal)) {
            LocationPicker(store: store)
                .presentationDetents([
                    .fraction(0.5),
                    .medium
                    ])
                .edgesIgnoringSafeArea(.all)
        }
    }
}
