//
//  LocationSelectView.swift
//  CleanArea
//
//  Created by 노주영 on 12/14/23.
//

import SwiftUI

struct LocationSelectView: View {
    @EnvironmentObject var vm: StartVM
    
    @Binding var isHiddenLocation: Bool
    @Binding var isHiddenEmployment: Bool
    
    @State private var isHidden: Bool = true
    @State private var selectIndex: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Image("CleanImage")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                TypingAnimationView(fullText: "거주지를 선택해주세요", speed: 0.1, onCompleted: {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                        isHidden = false
                    }
                })
                Spacer()
                
                Button {
                    isHiddenLocation = true
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
                        isHiddenEmployment = false
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.mainGreen)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            
            if !isHidden {
                ScrollView {
                    VStack {
                        ForEach(0..<vm.citys.count) { index in
                            if index%3 == 2 {
                                HStack {
                                    StartCellView(selectIndex: $selectIndex, index: index-2, choose: "1")
                                        .environmentObject(vm)
                                    StartCellView(selectIndex: $selectIndex, index: index-1, choose: "1")
                                        .environmentObject(vm)
                                    StartCellView(selectIndex: $selectIndex, index: index, choose: "1")
                                        .environmentObject(vm)
                                }
                            } else if index == vm.citys.count-1 {
                                HStack {
                                    StartCellView(selectIndex: $selectIndex, index: index-1, choose: "1")
                                        .environmentObject(vm)
                                    StartCellView(selectIndex: $selectIndex, index: index, choose: "1")
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
}
