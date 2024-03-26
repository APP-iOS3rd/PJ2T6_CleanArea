//
//  ListItemView.swift
//  CleanArea
//
//  Created by 최동호 on 12/11/23.
//

import ComposableArchitecture

import SwiftUI


@Reducer
struct ListItemFeature {
    @ObservableState
    struct State: Equatable {
        var policy: YouthPolicy
        var currentProgress: String = ""
        var category: String = ""
        var dDayText: String = ""
        var progressColor: Color
    }
    
    enum Action {
        case appearSet(YouthPolicy)
        case convertCodeToCategory(String)
        case setDDayText(Date)
        case calculateDay(String)
        case setProgressColor
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .appearSet(policy):
                return .run { send in
                    await send(.calculateDay(policy.bizPrdCn))
                    await send(.setProgressColor)
                    await send(.convertCodeToCategory(policy.polyRlmCd))
                }
                
            case let .calculateDay(dateString):
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
                        return .run { send in
                            await send(.setDDayText(endDate))
                        }
                    }
                    
                    let date = dateString.split(separator: "-").map(String.init)
                    if let endDateString = date.last, let endDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)),
                       endDate >= Date() {
                        return .run { send in
                            await send(.setDDayText(endDate))
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
                        }
                    }
                    
                    let date = dateString.split(separator: "-").map(String.init)
                    if let endDateString = date.last, let endMonthDate = dateFormatter.date(from: endDateString.trimmingCharacters(in: .whitespaces)) {
                        let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: endMonthDate)!
                        return .run { send in
                            await send(.setDDayText(nextMonthDate))
                        }           
                    }
                }
                state.currentProgress = "진행중"
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
                state.progressColor = state.dDayText == "마감" ? Color.deadline : Color.proceed
                return .none
                
            case let .setDDayText(endDate):
                let calendar = Calendar.current
                let components = calendar.dateComponents([.day], from: Date(), to: endDate)
                if let days = components.day, days >= 0 {
                    state.dDayText = "D-\(days)"
                    return . none
                }
                state.currentProgress = "마감"
                return .none
            }
        }
    }
}

struct ListItemView: View {

    @Bindable var store: StoreOf<ListItemFeature>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(store.policy.polyBizSjnm)
                    .font(.pretendardRegular20)
                    .foregroundStyle(.black)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(store.progressColor)
                            .frame(width: 70, height: 25)
                        
                        Text(store.currentProgress)
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(.white)
                    }
                    if store.dDayText != "마감" && store.dDayText != "진행중" {
                        HStack{
                            Text(store.dDayText)
                                .font(.pretendardRegular13)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
            
            VStack {
                StarBtn(policy: store.policy)
                    .padding(2)
                
                Text(store.category)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(width: UIScreen.main.bounds.width * 0.2)
            }
        }
        .padding()
        .background(Color.backgroundGreen)
        .cornerRadius(10)
        .onAppear{
            store.send(.appearSet(store.policy))
        }
    }
}

