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
