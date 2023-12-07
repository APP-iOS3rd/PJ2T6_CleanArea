//
//  DetailEtcView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailEtcView: View {
    @Binding var selectedIndex: Int
    
    var proxy: ScrollViewProxy?
    var youthPolicy: YouthPolicy?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("기타")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.mainGreen)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding(.top, 30)
            
            ForEach(0..<5){ index in
                let choose = chooseTitle(index)
                Text(choose.0)
                    .modifier(DetailSemiTitleModifier())
                Text(choose.1)
                    .modifier(DetailSemiContentModifier())
                    .padding(.top, -10)
            }
        }
        .id(3)
        .padding(.horizontal, 20)
        .padding(.bottom, 250)
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
/*
 #Preview {
 DetailEtcView()
 }
 */
