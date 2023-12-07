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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("신청 자격")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color.init(hex: "1E482D"))
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding(.top, 30)
            
            Text("연령")
                .modifier(DetailSemiTitleModifier())
            Text("제한없음")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("학력")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("전공")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("취업 상태")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("특화 분야")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("추가 단서 사항")
                .modifier(DetailSemiTitleModifier())
            Text("-")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("거주지 및 소득")
                .modifier(DetailSemiTitleModifier())
            Text("구입, 전월세 목적으로 금융권 대출을 실행한 청년 및 신혼부부 가구① 청년 유형 - 미혼인 19~34세의 청년 또는 혼인신고 7년 초과인 기혼 청년 - 연속해서 1년 이상 수영구에 주민등록 - 대출을 실행한 주택의 주소지에 등본상 거주 - 2022년 소득금액증명원 기준 연 소득 4천만 원 이하 - 전국 기준 무주택자 (주택 구입의 경우 수영구 내 1주택(거주용) 허용) - 2022. 12. 31. 이전 '주택, 임차, 전세' 등 주거 자금 대출을 받은 자② 신혼부부 유형 - 부부 중 신청자 19~34세의 청년 (혼인신고 7년 이내) - 부부 모두 연속해서 1년 이상 수영구에 주민등록 - 대출을 실행한 주택의 주소지에 등본상 부부 중 한 명 이상 거주 - 2022년 소득금액증명원 기준 연 소득 7천만 원 이하 (부부합산) - 2022. 12. 31. 이전 '주택, 임차, 전세' 등 주거 자금 대출을 받은 자")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
            
            Text("참여 제한 대상")
                .modifier(DetailSemiTitleModifier())
            Text("·국민기초생활수급자(생계, 의료, 주거급여 수급자)·대출 용도가 주거자금이 아닌 자(일반, 신용대출, 마이너스대출 등)·공공임대주택(국민임대, 영구임대, 매입임대, 전세임대, 행복주택 등) 거주자·건축물대장상 불법건축물 등 주택이 아닌 곳(예외 : 주거용 오피스텔)·신청인 및 배우자의 직계존비속(신청인의 배우자 포함)과 주택 거래 계약을 체결한 경우·본인 명의의 통장 입출금 거래가 불가능한 자·기타 사업 취지에 부합하지 않다고 판단되는 경우")
                .modifier(DetailSemiContentModifier())
                .padding(.top, -10)
        }
        .id(1)
        .padding(.horizontal, 20)
    }
}

/*
#Preview {
    DetailQualificationView()
}
*/
