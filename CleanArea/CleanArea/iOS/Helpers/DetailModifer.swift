//
//  DetailModifer.swift
//  CleanArea
//
//  Created by 최동호 on 12/7/23.
//

import Foundation
import SwiftUI

struct TagModifier: ViewModifier {
    @Binding var selectIndex: Int
    var index: Int
    
    func body(content: Content) -> some View {
        content
            .bold()
            .background(
                Rectangle()
                    .cornerRadius(10)
                    .foregroundStyle(selectIndex == index ? .mainGreen : .white)
                    .shadow(color: Color(uiColor: UIColor.systemGray3), radius: 5, x: 1, y: 1)
            )
    }
}

struct DetailSemiTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .font(.system(size: 17, weight: .semibold))
    }
}

struct DetailSemiContentModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .font(.system(size: 17))
            .foregroundStyle(.textGray)
    }
}
