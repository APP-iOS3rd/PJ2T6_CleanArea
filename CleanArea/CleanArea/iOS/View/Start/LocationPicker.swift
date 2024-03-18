//
//  LocationPicker.swift
//  CleanArea
//
//  Created by 이민호 on 12/7/23.
//

import SwiftUI

struct LocationPicker: View {
    @State private var selectedCity: City = .가평군
    
    @Binding var showModal: Bool
    @Binding var city: City?
    
    var body: some View {
        VStack {
            Picker("도시 선택", selection: $selectedCity) {
                ForEach(City.allCases, id: \.self) { city in
                    Text(city.getString()).tag(city)
                }
            }
            .pickerStyle(.inline)
            .padding()
            
            Button {
                showModal = false
                city = selectedCity
            } label: {
                Text("선택완료")
            }
        }
    }
}
