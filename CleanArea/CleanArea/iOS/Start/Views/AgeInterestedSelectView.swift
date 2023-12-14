//
//  AgeInterestedSelectView.swift
//  CleanArea
//
//  Created by 노주영 on 12/14/23.
//

import SwiftUI

struct AgeInterestedSelectView: View {
    @EnvironmentObject var vm: StartVM
    
    @Binding var isHiddenAge: Bool
    
    @State private var isHidden1: Bool = true
    @State private var isHidden2: Bool = true
    @State private var selectIndex: Int = 0
    
    @State var isHiddenInterested = true
    
    var body: some View {
        VStack {
            HStack {
                Image("CleanImage")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                TypingAnimationView(fullText: "나이를 입력해주세요", speed: 0.1, onCompleted: {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                        isHidden1 = false
                    }
                })
                Spacer()
                
                Button {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
                        isHiddenInterested = false
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.mainGreen)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            
            if !isHidden1 {
                TextField("", text: $vm.age)
                    .padding()
                    .bold()
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .foregroundStyle(.mainGreen)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 20)
            }
            
            if !isHiddenInterested {
                HStack {
                    Image("CleanImage")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    TypingAnimationView(fullText: "관심있는 정책 이름을 입력해주세요", speed: 0.1, onCompleted: {
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                            isHidden2 = false
                        }
                    })
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 40)
                .padding(.top, 70)
            }
            
            if !isHidden2 {
                TextField("", text: $vm.policyName)
                    .padding()
                    .bold()
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .foregroundStyle(.mainGreen)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 20)
            }
        }
    }
}
/*
 StartTextField(text: $vm.age,
                type: .age,
                width: 300)
 StartTextField(text: $vm.policyName,
                type: .policyName,
                width: 300)
 */
