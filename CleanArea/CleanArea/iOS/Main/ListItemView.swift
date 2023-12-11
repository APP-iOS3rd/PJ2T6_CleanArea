//
//  ListItemView.swift
//  CleanArea
//
//  Created by 최동호 on 12/11/23.
//

import Foundation
import SwiftUI

struct ListItemView: View {
    var sequenceNumber: Int?
    var polyBizSjnm: String
    var bizPrdCn: String
    var polyCategory: String
    
    @State private var isLike: Bool = false
    @State private var progress: String = ""
    
    var body: some View {
        let dDayText = calculateDday(from: bizPrdCn)
        let currentProgress = dDayText == "마감" ? "마감" : "진행중"
        
        HStack {
            VStack(alignment: .leading) {
                if (sequenceNumber != nil) {
                    HStack{
                        Text("\(sequenceNumber!)")
                            .font(.system(size: 20))
                        Text(polyBizSjnm)
                            .font(.system(size: 20))
                    }
                } else {
                    Text(polyBizSjnm)
                        .font(.system(size: 20))
                }
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
                    .padding(.leading, 10)
                    
                    VStack {
                        Text(bizPrdCn)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        Text(dDayText)
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                    }
                }
            }
            Spacer()
            
            VStack {
                Button(action: {
                    isLike.toggle()
                }) {
                    Image(systemName: isLike ? "star.fill" : "star")
                        .foregroundColor(.buttonGreen)
                        .font(.system(size: 20))
                }
                .padding(2)
                
                Text(polyCategory)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.backgroundGreen)
        .cornerRadius(10)
        .onAppear {
            self.progress = currentProgress
        }
        
    }
    
    func calculateDday(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd."
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        let dates = dateString.split(separator: "~").map(String.init)
        if let endDateString = dates.last, let endDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)), endDate >= Date() {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: Date(), to: endDate)
            if let days = components.day {
                return "D-\(days)"
            }
        }
        return "마감"
    }
    
    private var progressColor: Color {
        switch progress {
        case "마감":
            return Color.deadline
        default:
            return Color.proceed
        }
    }
    
}
