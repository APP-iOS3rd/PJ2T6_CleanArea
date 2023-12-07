//
//  DetailSummaryView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailSummaryView: View {
    @Binding var selectedIndex: Int
    
    var proxy: ScrollViewProxy?
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                HStack {
                    Text("교육 분야")
                        .frame(width: (UIScreen.main.bounds.width - 70)/3, height: 50)
                        .modifier(TagModifier())
                
                    Spacer()
                    Text("18 ~ 34세")
                        .frame(width: (UIScreen.main.bounds.width - 70)/3, height: 50)
                        .modifier(TagModifier())
                    
                    Spacer()
                    Text("약 300명")
                        .frame(width: (UIScreen.main.bounds.width - 70)/3, height: 50)
                        .modifier(TagModifier())
                }
                
                Text("운영 기간: 2023.01.01.~2023.12.31.")
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .modifier(TagModifier())
                
                Text("신청 기간: 매년 일정시기")
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .modifier(TagModifier())
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("한 눈에 보는 정책 요약")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color.init(hex: "1E482D"))
                    .padding(.top, 30)
                
                HStack {
                    Text("정책 분야")
                        .modifier(DetailSemiTitleModifier())
                    
                    Spacer()
                    
                    Text("교육 분야")
                        .modifier(DetailSemiContentModifier())
                }
                
                HStack {
                    Text("지원 규모")
                        .modifier(DetailSemiTitleModifier())
                    
                    Spacer()
                    
                    Text("약 300명")
                        .modifier(DetailSemiContentModifier())
                }
                
                Text("신청 기간")
                    .modifier(DetailSemiTitleModifier())
                
                Text("2023년 08월 21일 ~ 2023년 09월 08일")
                    .modifier(DetailSemiContentModifier())
                    .padding(.top, -10)
                
                Text("지원 내용")
                    .modifier(DetailSemiTitleModifier())
                
                Text("구입, 전월세 목적으로 금융권 대출을 실행한 대출 잔액의 1%, 가구당 100만 원 이내에서 지원(매년 1회 신청·접수, 회차당 50만 원까지 지원)")
                    .modifier(DetailSemiContentModifier())
                    .padding(.top, -10)
                
            }
        }
        .id(0)
        .padding(.horizontal, 20)
    }
}



/*
#Preview {
    DetailSummaryView()
}*/
