//
//  StartLocationField.swift
//  CleanArea
//
//  Created by 이민호 on 12/7/23.
//

import ComposableArchitecture

import SwiftUI

struct StartLocationField: View {
    @Bindable var store: StoreOf<LocationFeature>
    
    var body: some View {
        VStack {
            HStack {
                Text(store.type.title)
                    .font(.pretendardRegular20)
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 10)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            SelectCityBox(store: store)
        }
    }
}

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
