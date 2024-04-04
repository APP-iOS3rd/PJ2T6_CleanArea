//
//  DetailEtcView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailEtcView: View {
    @State var isModaling1: Bool = false
    @State var isModaling2: Bool = false
    
    var youthPolicy: YouthPolicy?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("⭐️ 기타")
                    .font(.pretendardSemiBold20)
                    .foregroundStyle(.mainGreen)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding(.top, 30)
            
            ForEach(0..<5){ index in
                let choose = chooseTitle(index)
                
                if index == 3 && String(choose.1.prefix(4)) == "http" {
                    HStack {
                        Text(choose.0)
                            .modifier(DetailSemiTitleModifier())
                        Spacer()
                        Text("\(String(isModaling1))")
                            .foregroundStyle(.isModal)
                    }
                    
                    Button(action: {
                        isModaling1.toggle()
                    }, label: {
                        Text(choose.1)
                            .multilineTextAlignment(.leading)
                            .font(.pretendardBold17)
                            .foregroundStyle(.blue)
                    })
                    .fullScreenCover(isPresented: $isModaling1) {
                        WebSiteView(url: choose.1, isModaling: $isModaling1)
                    }
                } else if index == 4 && String(choose.1.prefix(4)) == "http" {
                    HStack {
                        Text(choose.0)
                            .modifier(DetailSemiTitleModifier())
                        Spacer()
                        Text("\(String(isModaling2))")
                            .foregroundStyle(.isModal)
                    }
                    
                    Button(action: {
                        isModaling2.toggle()
                    }, label: {
                        Text(choose.1)
                            .multilineTextAlignment(.leading)
                            .font(.pretendardBold17)
                            .foregroundStyle(.blue)
                    })
                    .fullScreenCover(isPresented: $isModaling2) {
                        WebSiteView(url: choose.1, isModaling: $isModaling2)
                    }
                } else {
                    Text(choose.0)
                        .modifier(DetailSemiTitleModifier())
                    
                    Text(choose.1)
                        .modifier(DetailSemiContentModifier())
                        .padding(.top, -10)
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    private func chooseTitle(_ index: Int) -> (String, String){
        switch index {
        case 0: return ("기타 유익 정보", youthPolicy?.etct ?? "")
        case 1: return ("주관 기관", youthPolicy?.mngtMson ?? "")
        case 2: return ("운영 기관", youthPolicy?.cnsgNmor ?? "")
        case 3: return ("사업관련 참고 사이트1", youthPolicy?.rfcSiteUrla1 ?? "")
        case 4: return ("사업관련 참고 사이트2", youthPolicy?.rfcSiteUrla2 ?? "")
        default: return ("","")
        }
    }
}
