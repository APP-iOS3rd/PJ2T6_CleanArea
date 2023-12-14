//
//  StartCellView.swift
//  CleanArea
//
//  Created by 노주영 on 12/14/23.
//

import SwiftUI

struct StartCellView: View {
    @EnvironmentObject var vm: StartVM
    
    @Binding var selectIndex: Int
    
    var index: Int
    var choose: String
    
    var body: some View {
        Button {
            selectIndex = index
        } label: {
            if choose == "1" {
                Text(vm.citys[index])
                    .frame(width: (UIScreen.main.bounds.width)/5, height: 40)
                    .foregroundStyle(selectIndex == index ? .white : .mainGreen)
                    .modifier(TagModifier(selectIndex: $selectIndex, index: index))
            } else if choose == "2" {
                Text(vm.employmentStatusOptions[index])
                    .frame(width: (UIScreen.main.bounds.width)/4, height: 40)
                    .foregroundStyle(selectIndex == index ? .white : .mainGreen)
                    .modifier(TagModifier(selectIndex: $selectIndex, index: index))
            } else {
                Text(vm.educationLevelOptions[index])
                    .frame(width: (UIScreen.main.bounds.width)/4, height: 40)
                    .foregroundStyle(selectIndex == index ? .white : .mainGreen)
                    .modifier(TagModifier(selectIndex: $selectIndex, index: index))
            }
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.7 ,blendDuration: 1), value: selectIndex)
        .padding(.top, vm.randomPos.randomElement() ?? 0)
        .padding(.leading, vm.randomPos.randomElement() ?? 0)
        .padding(.trailing, vm.randomPos.randomElement() ?? 0)
        .padding(.bottom, vm.randomPos.randomElement() ?? 0)
    }
}
