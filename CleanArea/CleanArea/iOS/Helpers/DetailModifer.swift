//
//  DetailModifer.swift
//  CleanArea
//
//  Created by 최동호 on 12/7/23.
//

import Foundation
import SwiftUI

struct TagModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .background(
                Rectangle()
                    .cornerRadius(10)
                    .foregroundStyle(.backgroundGreen)
                    .shadow(color: Color(uiColor: UIColor.systemGray3), radius: 5, x: 5, y: 5)
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
