//
//  StartView.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var vm: StartVM

    var body: some View {
        VStack {
            HStack {
                Text("청정구역")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 20)
                Spacer()
            }
            .frame(width: 300)
            .padding()
            
            StartTextField(text: $vm.residence,
                           type: .residence,
                           width: 300)
                            .environmentObject(vm)
            StartTextField(text: $vm.employmentStatus,
                           type: .employmentStatus,
                           width: 300)
                            .environmentObject(vm)
            StartTextField(text: $vm.educationLevel,
                           type: .educationLevel,
                           width: 300)
                            .environmentObject(vm)
            StartTextField(text: $vm.age,
                           type: .age,
                           width: 300)
            StartTextField(text: $vm.policyName,
                           type: .policyName,
                           width: 300)
            Spacer()
            
            Button(action: {
                vm.search()
            }, label: {
                Text("정책검색")
                    .font(.title3)
                    .padding()
                    .background(.buttonGreen)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            .frame(width: 140, height: 50)
            Spacer()
        }
    }
}

#Preview {
    StartView(vm: StartVM())
}
