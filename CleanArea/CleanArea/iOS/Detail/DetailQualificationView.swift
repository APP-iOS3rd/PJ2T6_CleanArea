//
//  DetailQualificationView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailQualificationView: View {
    @Binding var selectedIndex: Int
    
    var proxy: ScrollViewProxy?
    var youthPolicy: YouthPolicy?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("신청 자격")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.mainGreen)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding(.top, 30)
            
            ForEach(0..<8){ index in
                let choose = chooseTitle(index)
                Text(choose.0)
                    .modifier(DetailSemiTitleModifier())
                Text(choose.1)
                    .modifier(DetailSemiContentModifier())
                    .padding(.top, -10)
            }
        }
        .id(1)
        .padding(.horizontal, 20)
    }
    
    private func chooseTitle(_ index: Int) -> (String, String){
        switch index {
        case 0: return ("연령", youthPolicy?.ageInfo ?? "")
        case 1: return ("학력", youthPolicy?.accrRqisCn ?? "")
        case 2: return ("전공", youthPolicy?.majrRqisCn ?? "")
        case 3: return ("취업 상태", youthPolicy?.empmSttsCn ?? "")
        case 4: return ("특화 분야", youthPolicy?.splzRlmRqisCn ?? "")
        case 5: return ("추가 단서 사항", youthPolicy?.aditRscn ?? "")
        case 6: return ("거주지 및 소득", youthPolicy?.prcpCn ?? "")
        case 7: return ("참여 제한 대상", youthPolicy?.prcpLmttTrgtCn ?? "")
        default: return ("","")
        }
    }
}

/*
#Preview {
    DetailQualificationView()
}
*/
