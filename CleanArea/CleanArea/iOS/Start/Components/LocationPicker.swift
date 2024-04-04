//
//  LocationPicker.swift
//  CleanArea
//
//  Created by 이민호 on 12/7/23.
//

import ComposableArchitecture

import SwiftUI

struct LocationPicker: View {
    @Bindable var store: StoreOf<LocationFeature>

    var body: some View {
        VStack {
            Picker("도시 선택", selection: $store.selectedCity.sending(\.selectCity)) {
                ForEach(City.allCases, id: \.self) { city in
                    Text(city.getString()).tag(city)
                }
            }
            .pickerStyle(.inline)
            .padding()
            
            Button {
                store.send(.setCity)
            } label: {
                Text("선택완료")
            }
        }
    }
}
