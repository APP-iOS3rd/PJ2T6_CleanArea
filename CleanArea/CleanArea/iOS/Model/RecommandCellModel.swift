//
//  RecommandCellModel.swift
//  CleanArea
//
//  Created by 김건호 on 12/6/23.
//

import Foundation

struct RecommandCellModel: Equatable {
    var name: String
    var count: Int
    var destinationKey: String
    var policies: [YouthPolicy]
}
