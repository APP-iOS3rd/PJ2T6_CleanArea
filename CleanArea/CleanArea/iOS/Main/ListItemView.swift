//
//  ListItemView.swift
//  CleanArea
//
//  Created by 최동호 on 12/11/23.
//

import Foundation
import SwiftUI

struct ListItemView: View {
    var policy: YouthPolicy
    @State private var isLike: Bool = false
    @State private var currentProgress: String = "진행중"
    
    var body: some View {
        let dDayText = calculateDay(from: policy.bizPrdCn)
        
        HStack {
            VStack(alignment: .leading) {
                
                Text(policy.polyBizSjnm)
                    .font(.system(size: 20))
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(progressColor)
                            .frame(width: 70, height: 25)
                        
                        Text(currentProgress)
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(.white)
                        
                    }
                    if dDayText != "마감" && dDayText != "진행중" {
                        HStack{
                            Text(dDayText)
                                .font(.system(size: 13))
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
            
            VStack {
                StarBtn(policy: policy)
                    .padding(2)
                
                Text(convertCodeToCategory(policy.polyRlmCd))
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.backgroundGreen)
        .cornerRadius(10)
        .onAppear{
            currentProgress = dDayText == "마감" ? "마감" : "진행중"
        }
    }
}

//MARK: 디데이, 상태, 정책분야
extension ListItemView {
    func calculateDay(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        let dateFormats = [
            "yyyy.MM.dd.",
            "yyyy.MM.dd"
        ]
        
        for format in dateFormats {
            dateFormatter.dateFormat = format
            let dates = dateString.split(separator: "~").map(String.init)
            if let endDateString = dates.last, let endDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)),
               endDate >= Date() {
                return calculateDays(to: endDate)
            }
            
            let date = dateString.split(separator: "-").map(String.init)
            if let endDateString = date.last, let endDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)),
               endDate >= Date() {
                return calculateDays(to: endDate)
            }
        }
        
        let monthDateFormats = [
            "yyyy.MM.",
            "yyyy.MM",
            "yyyy.M.",
            "yyyy.M"
        ]
        
        for format in monthDateFormats {
            dateFormatter.dateFormat = format
            let dates = dateString.split(separator: "~").map(String.init)
            if let endDateString = dates.last, let endMonthDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)) {
                let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: endMonthDate)!
                return calculateDays(to: nextMonthDate)
            }
            
            let date = dateString.split(separator: "-").map(String.init)
            if let endDateString = date.last, let endMonthDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)) {
                let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: endMonthDate)!
                return calculateDays(to: nextMonthDate)
            }
        }
        return "진행중"
    }
    
    private func calculateDays(to endDate: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: Date(), to: endDate)
        if let days = components.day, days >= 0 {
            return "D-\(days)"
        }
        return "마감"
    }
    
    private var progressColor: Color {
        currentProgress == "마감" ? Color.deadline : Color.proceed
    }
    
    func convertCodeToCategory(_ code: String) -> String {
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
