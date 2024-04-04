//
//  HiddenKeyboard.swift
//  CleanArea
//
//  Created by 노주영 on 3/29/24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
