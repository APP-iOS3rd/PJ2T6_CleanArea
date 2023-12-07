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
    var sphere: String?
    var youthPolicy: YouthPolicy?
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                HStack {
                    Text(sphere ?? "")
                        .frame(width: (UIScreen.main.bounds.width - 70)/3, height: 50)
                        .modifier(TagModifier())
                
                    Spacer()
                    Text(youthPolicy?.ageInfo ?? "")
                        .frame(width: (UIScreen.main.bounds.width - 70)/3, height: 50)
                        .modifier(TagModifier())
                    
                    Spacer()
                    Text(youthPolicy?.sporScvl ?? "")
                        .frame(width: (UIScreen.main.bounds.width - 70)/3, height: 50)
                        .modifier(TagModifier())
                }
                
                Text("운영 기간: \(youthPolicy?.bizPrdCn ?? "")")
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .modifier(TagModifier())
                
                Text("신청 기간: \(youthPolicy?.rqutPrdCn ?? "")")
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .modifier(TagModifier())
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("한 눈에 보는 정책 요약")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 30)
                
                HStack {
                    Text("정책 분야")
                        .modifier(DetailSemiTitleModifier())
                    
                    Spacer()
                    
                    Text(sphere ?? "")
                        .modifier(DetailSemiContentModifier())
                }
                
                HStack {
                    Text("지원 규모")
                        .modifier(DetailSemiTitleModifier())
                    
                    Spacer()
                    
                    Text(youthPolicy?.sporScvl ?? "")
                        .modifier(DetailSemiContentModifier())
                }
                
                ForEach(0..<2){ index in
                    let choose = chooseTitle(index)
                    Text(choose.0)
                        .modifier(DetailSemiTitleModifier())
                    Text(choose.1)
                        .modifier(DetailSemiContentModifier())
                        .padding(.top, -10)
                }
            }
        }
        .id(0)
        .padding(.horizontal, 20)
    }
    
    private func chooseTitle(_ index: Int) -> (String, String){
        switch index {
        case 0: return ("신청 기간", "2123231213123213123213")
        case 1: return ("지원 내용", youthPolicy?.sporCn ?? "")
        default: return ("","")
        }
    }
}



/*
#Preview {
    DetailSummaryView()
}*/
