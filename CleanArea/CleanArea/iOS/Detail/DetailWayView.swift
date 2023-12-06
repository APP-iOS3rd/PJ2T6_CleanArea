//
//  DetailWayView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailWayView: View {
    @Binding var selectedIndex: Int
    
    var proxy: ScrollViewProxy?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("신청방법")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color.init(hex: "1E482D"))
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding(.top, 30)
            
            Text("신청절차")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("심시 및 발표")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("신청 사이트")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("제출 서류")
                .modifier(DetailSemiTitleModifier())
            Text("수영구청 청년포털 홈페이지 공고문 참조")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
        }
        .id(2)
        .padding(.horizontal, 20)
    }
}

/*
 #Preview {
 DetailWayView()
 }*/
