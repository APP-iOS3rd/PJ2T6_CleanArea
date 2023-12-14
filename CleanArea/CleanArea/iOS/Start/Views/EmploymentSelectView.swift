//
//  EmploymentSelectView.swift
//  CleanArea
//
//  Created by 노주영 on 12/14/23.
//

import SwiftUI

struct EmploymentSelectView: View {
    @EnvironmentObject var vm: StartVM
    
    @Binding var isHiddenEmployment: Bool
    
    @State private var isHidden: Bool = true
    @State private var selectIndex: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Image("CleanImage")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                TypingAnimationView(fullText: "취업상태를 선택해주세요", speed: 0.1, onCompleted: {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                        isHidden = false
                    }
                })
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.mainGreen)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            
            if !isHidden {
                VStack {
                    ForEach(0..<vm.employmentStatusOptions.count) { index in
                        if index%3 == 2 {
                            HStack {
                                StartCellView(selectIndex: $selectIndex, index: index-2, choose: "2")
                                    .environmentObject(vm)
                                StartCellView(selectIndex: $selectIndex, index: index-1, choose: "2")
                                    .environmentObject(vm)
                                StartCellView(selectIndex: $selectIndex, index: index, choose: "2")
                                    .environmentObject(vm)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .padding(.horizontal, 10)
            }
        }
    }
}
