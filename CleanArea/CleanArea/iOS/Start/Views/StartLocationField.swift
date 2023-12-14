//
//  StartLocationField.swift
//  CleanArea
//
//  Created by 이민호 on 12/7/23.
//

import SwiftUI

struct StartLocationField: View {
    @EnvironmentObject var vm: StartVM
    var type: TextFieldType
    var width: Int
    
    var body: some View {
        VStack {
            HStack {
                Text(type.title)
                    .font(.headline)
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 10)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            SelectCityBox(city: $vm.residence, type: type, width: width)
        }
    }
}

struct SelectCityBox: View {
    @EnvironmentObject var vm: StartVM
    @State private var showModal = false
    @Binding var city: City?
    
    var type: TextFieldType
    var width: Int
    
    var body: some View {
        Button {
            self.showModal = true
        } label: {
            HStack {
                Text(city?.getString() ?? "주거지를 선택해 주세요")
                    .foregroundColor((city == nil) ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
            }
            .padding()            
            .foregroundColor(.gray)
            .background(Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 50)
        .sheet(isPresented: self.$showModal) {
            LocationPicker(showModal: $showModal, city: $city)
                .presentationDetents([
                    .fraction(0.5),
                    .medium
                    ])
                .edgesIgnoringSafeArea(.all)
        }
    }
}

//#Preview {
//    StartLocationField()
//}
