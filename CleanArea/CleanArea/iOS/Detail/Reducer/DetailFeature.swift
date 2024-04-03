//
//  DetailFeature.swift
//  CleanArea
//
//  Created by 최동호 on 4/3/24.
//

import ComposableArchitecture

import SwiftUI

@Reducer
struct DetailFeature {
    @ObservableState
    struct State: Equatable {
        var cityImage: City?                            //시 이미지
        var likePolicies: IdentifiedArrayOf<YouthPolicy> = []
        var likeStatus: Bool = false
        var youthPolicy: YouthPolicy = .init(bizId: "", polyBizSecd: "", polyBizTy: "", polyBizSjnm: "", polyItcnCn: "", sporCn: "", sporScvl: "", bizPrdCn: "", prdRpttSecd: "", rqutPrdCn: "", ageInfo: "", majrRqisCn: "", empmSttsCn: "", splzRlmRqisCn: "", accrRqisCn: "", prcpCn: "", aditRscn: "", prcpLmttTrgtCn: "", rqutProcCn: "", pstnPaprCn: "", jdgnPresCn: "", rqutUrla: "", rfcSiteUrla1: "", rfcSiteUrla2: "", mngtMson: "", mngtMrofCherCn: "", cherCtpcCn: "", cnsgNmor: "", tintCherCn: "", tintCherCtpcCn: "", etct: "", polyRlmCd: "", minAge: "", maxAge: "", startDate: "", endDate: "", views: 0)                    //정책 내용
        
        mutating func addItem() {
            @Dependency(\.swiftData) var swiftData
            do {
                try swiftData.add(youthPolicy)
            } catch {
                print("error :: addItem", error.localizedDescription)
            }
        }
        
        mutating func deleteItem() {
            @Dependency(\.swiftData) var swiftData
            do {
                try swiftData.delete(youthPolicy)
            } catch {
                print("error :: delelteItems", error.localizedDescription)
            }
        }
        
        mutating func fetchItems() {
            @Dependency(\.swiftData) var swiftData
            do {
                self.likePolicies = IdentifiedArray(uniqueElements: try swiftData.fetch())
            } catch {
                print("error :: fetchItems", error.localizedDescription)
            }
        }
    }
    
    enum Action {
        case addLike
        case checkLikeStatus
        case deleteLike
        case onAppear
        case setStatus(Bool)
        case tabBackButton
        case tabStarButton
    }
    
    @Dependency(\.dismiss) var dismiss

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addLike:
                return .run { [addItem = state.addItem(),
                               fetchItems = state.fetchItems()] send in
                    addItem
                    fetchItems
                    await send(.checkLikeStatus)
                }
                
            case .checkLikeStatus:
                return .run { [likePolicies = state.likePolicies,
                                youthPolicy = state.youthPolicy] send in
                    let likeStatus = likePolicies.contains {
                        $0.bizId == youthPolicy.bizId
                    }
                    await send(.setStatus(likeStatus))
                }
                
            case .deleteLike:
                return .run { [deleteItem = state.deleteItem(),
                               fetchItems = state.fetchItems()] send in
                    deleteItem
                    fetchItems
                    await send(.checkLikeStatus)
                }
                
            case let .setStatus(status):
                state.likeStatus = status
                return .none
                
            case .onAppear:
                return .run { [policyId = state.youthPolicy.bizId,
                               fetchItems = state.fetchItems()] send in
                    guard let url = URL(string: "\(requestIP)/views") else { return }
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    let body: [String: Any] = ["bizId": policyId]
                    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
                
                    do {
                        let (_, response) = try await URLSession.shared.data(for: request)
                        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                            print("데이터 전송 실패")
                            return
                        }
                        print("데이터 전송 성공")
                    } catch {
                        print("데이터 전송 에러: \(error.localizedDescription)")
                    }
                    
                    fetchItems
                    
                    await send(.checkLikeStatus)
                }
            case .tabBackButton:
                return .run { _ in
                    await self.dismiss()
                }
            case .tabStarButton:
                return .run { [likeStatus = state.likeStatus] send in
                    if likeStatus {
                        await send(.deleteLike)
                    } else {
                        await send(.addLike)
                    }
                }
            }
        }
    }
}
