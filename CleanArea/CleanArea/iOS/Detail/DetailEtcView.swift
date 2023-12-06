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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("기타")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color.init(hex: "1E482D"))
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding(.top, 30)
            
            Text("기타 유익 정보")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("주간 기관")
                .modifier(DetailSemiTitleModifier())
            Text("부산시 수영구청 일자리경제과")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("운영 기관")
                .modifier(DetailSemiTitleModifier())
            Text("수영구청 일자리경제과")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("사업관련 참고 사이트1")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("사업관련 참고 사이트2")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("첨부파일")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
        }
        .id(3)
        .padding(.horizontal, 20)
        .padding(.bottom, 110)
    }
}
/*
 #Preview {
 DetailEtcView()
 }
 */
