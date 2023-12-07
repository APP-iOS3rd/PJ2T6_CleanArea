//
//  RecommandVM.swift
//  CleanArea
//
//  Created by 김건호 on 12/6/23.
//

import SwiftUI

class RecommandVM: ObservableObject {
    @Published var recommandcellModels = [RecommandCellModel]()

    func updateModels() {
        recommandcellModels = [
            RecommandCellModel(name: "일자리", count: 1, destinationKey: "일자리"),
            RecommandCellModel(name: "주거", count: 2, destinationKey: "주거"),
            RecommandCellModel(name: "교육", count: 3, destinationKey: "교육"),
            RecommandCellModel(name: "복지,문화", count: 4, destinationKey: "복지,문화"),
            RecommandCellModel(name: "참여,권리", count: 5, destinationKey: "참여,권리")

        ]
    }
    
}

