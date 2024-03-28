//
//  RecommandVM.swift
//  CleanArea
//
//  Created by 김건호 on 12/6/23.
//
//
//import SwiftUI
//import Combine
//
//class RecommandVM: ObservableObject {
//    @Published var recommandcellModels = [RecommandCellModel]()
//    private var cancellables = Set<AnyCancellable>()
//    
//    init(apiViewModel: APIViewModel) {
//        apiViewModel.$policy
//            .compactMap { $0 } // nil이 아닌 경우에만 처리
//            .sink { [weak self] newPolicy in
//                self?.updateModels(policy: newPolicy)
//            }
//            .store(in: &cancellables)
//    }
//
//    private func updateModels(policy: Policy) {
//        print("RecommandVM: updateModels called, job count: \(policy.job.count)")
//        recommandcellModels = [
//            RecommandCellModel(name: "일자리", count: policy.job.count, destinationKey: "일자리", policies: policy.job),
//            RecommandCellModel(name: "주거", count: policy.residence.count, destinationKey: "주거", policies: policy.residence),
//            RecommandCellModel(name: "교육", count: policy.education.count, destinationKey: "교육", policies: policy.education),
//            RecommandCellModel(name: "복지,문화", count: policy.curture.count, destinationKey: "복지,문화", policies: policy.curture),
//            RecommandCellModel(name: "참여,권리", count: policy.participation.count, destinationKey: "참여,권리", policies: policy.participation)
//        ]
//    }
//}
