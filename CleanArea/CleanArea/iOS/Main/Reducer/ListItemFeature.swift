//
//  ListItemFeature.swift
//  CleanArea
//
//  Created by 최동호 on 3/26/24.
//

import ComposableArchitecture

import SwiftUI

@Reducer
struct ListItemFeature {
    @ObservableState
    struct State: Equatable {
        var category: String = ""
        var currentProgress: String = "진행중"
        var dDayText: String = ""
        var policy: YouthPolicy = .init(bizId: "", polyBizSecd: "", polyBizTy: "", polyBizSjnm: "", polyItcnCn: "", sporCn: "", sporScvl: "", bizPrdCn: "", prdRpttSecd: "", rqutPrdCn: "", ageInfo: "", majrRqisCn: "", empmSttsCn: "", splzRlmRqisCn: "", accrRqisCn: "", prcpCn: "", aditRscn: "", prcpLmttTrgtCn: "", rqutProcCn: "", pstnPaprCn: "", jdgnPresCn: "", rqutUrla: "", rfcSiteUrla1: "", rfcSiteUrla2: "", mngtMson: "", mngtMrofCherCn: "", cherCtpcCn: "", cnsgNmor: "", tintCherCn: "", tintCherCtpcCn: "", etct: "", polyRlmCd: "", minAge: "", maxAge: "", startDate: "", endDate: "", views: 0)
        var progressColor: Color = .proceed
    }
    
    enum Action {
        case appearSet
        case calculateDay(String)
        case convertCodeToCategory(String)
        case setDDayText(Date)
        case setProgressColor
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .appearSet:
                return .concatenate([
                    .run { [policy = state.policy] send in
                        await send(.calculateDay(policy.bizPrdCn))
                    },
                    .run { [policy = state.policy] send in
                        await send(.convertCodeToCategory(policy.polyRlmCd))
                    }
                ])
                
            case let .calculateDay(dateString):
                
                print(dateString)
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
                       endDate <= Date() {
                        return .run { send in
                            await send(.setDDayText(endDate))
                            await send(.setProgressColor)
                        }
                    }
                    
                    let date = dateString.split(separator: "-").map(String.init)
                    if let endDateString = date.last, let endDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)),
                       endDate <= Date() {
                        return .run { send in
                            await send(.setDDayText(endDate))
                            await send(.setProgressColor)
                        }
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
                        return .run { send in
                            await send(.setDDayText(nextMonthDate))
                            await send(.setProgressColor)
                        }
                    }
                    
                    let date = dateString.split(separator: "-").map(String.init)
                    if let endDateString = date.last, let endMonthDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)) {
                        let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: endMonthDate)!
                        return .run { send in
                            await send(.setDDayText(nextMonthDate))
                            await send(.setProgressColor)
                        }
                    }
                }
                return .none
            
            case let .convertCodeToCategory(code):
                switch code {
                case "023010":
                    state.category = "일자리분야"
                    
                case "023020":
                    state.category =  "주거분야"
                    
                case "023030":
                    state.category =  "교육분야"
                    
                case "023040":
                    state.category =  "문화분야"
                    
                case "023050":
                    state.category =  "참여,권리분야"
                    
                default:
                    state.category =  "알 수 없음"
                }
                return .none
                
            case .setProgressColor:
                state.progressColor = state.currentProgress == "마감" ? Color.deadline : Color.proceed
                return .none
                
            case let .setDDayText(endDate):
                let calendar = Calendar.current
                let components = calendar.dateComponents([.day], from: Date(), to: endDate)

                if let days = components.day, days >= 0 {
                    state.dDayText = "D-\(days)"
                    return .none
                }
                state.currentProgress = "마감"
                return .none
            }
        }
    }
}
