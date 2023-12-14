//
//  HeaderView.swift
//  CleanArea
//
//  Created by 김건호 on 12/12/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    var action: () -> Void

    var body: some View {
        HStack {
            Button(action: action) {
                Image(systemName: "chevron.left")
                    .bold()
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 20)
            }
            Text(title)
                .font(.pretendardBold30)
                .foregroundStyle(.mainGreen)
                .padding(.top, 20)
            Spacer()
        }
        .padding(.horizontal)
    }
}

