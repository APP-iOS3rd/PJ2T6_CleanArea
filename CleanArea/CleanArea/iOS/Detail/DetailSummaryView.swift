//
//  DetailSummaryView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailSummaryView: View {
    var youthPolicy: YouthPolicy?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("🔍 한 눈에 보는 정책 요약")
                    .multilineTextAlignment(.leading)
                    .font(.pretendardSemiBold20)
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 30)
                
                HStack(alignment: .top) {
                    Text("정책 분야")
                        .modifier(DetailSemiTitleModifier())
                    
                    Spacer()
                    
                    Text(convertCodeToCategory(youthPolicy?.polyRlmCd ?? ""))
                        .modifier(DetailSemiContentModifier())
                }
                
                HStack(alignment: .top) {
                    Text("지원 규모")
                        .modifier(DetailSemiTitleModifier())
                    
                    Spacer()
                    
                    Text(youthPolicy?.sporScvl ?? "")
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 17))
                        .foregroundStyle(.textGray)
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
        .padding(.horizontal, 20)
    }
}

extension DetailSummaryView {
    private func chooseTitle(_ index: Int) -> (String, String){
        switch index {
        case 0: return ("신청 기간", youthPolicy?.rqutPrdCn ?? "")
        case 1: return ("지원 내용", youthPolicy?.sporCn ?? "")
        default: return ("","")
        }
    }
    
    private func convertCodeToCategory(_ code: String) -> String {
            switch code {
            case "023010":
                return "일자리분야"
            case "023020":
                return "주거분야"
            case "023030":
                return "교육분야"
            case "023040":
                return "문화분야"
            case "023050":
                return "참여,권리분야"
            default:
                return "알 수 없음"
            }
        }
}

/*
#Preview {
    DetailSummaryView()
}*/
