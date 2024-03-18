//
//  RecommandVM.swift
//  CleanArea
//
//  Created by 김건호 on 12/6/23.
//

import SwiftUI

class RecommandVM: ObservableObject {
    @Published var recommandcellModels = [RecommandCellModel]()

    let policy: Policy

    init(policy: Policy) {
        self.policy = policy
        updateModels()
    }

    func updateModels() {
        recommandcellModels = [
            RecommandCellModel(name: "일자리", count: policy.job.count, destinationKey: "일자리", policies: policy.job),
            RecommandCellModel(name: "주거", count: policy.residence.count, destinationKey: "주거", policies: policy.residence),
            RecommandCellModel(name: "교육", count: policy.education.count, destinationKey: "교육", policies: policy.education),
            RecommandCellModel(name: "복지,문화", count: policy.curture.count, destinationKey: "복지,문화", policies: policy.curture),
            RecommandCellModel(name: "참여,권리", count: policy.participation.count, destinationKey: "참여,권리", policies: policy.participation)
        ]
    }
}
