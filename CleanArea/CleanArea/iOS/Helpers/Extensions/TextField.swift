//
//  TextField.swift
//  CleanArea
//
//  Created by 노주영 on 3/29/24.
//

import SwiftUI

extension TextField {
    func commonTextFieldStyle(width: CGFloat, keyboardType: UIKeyboardType? = nil) -> some View {
        self
            .padding()
            .font(.pretendardRegular20)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: 50)
            .background(Color(uiColor: .systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .keyboardType(keyboardType ?? .default)
    }
}
