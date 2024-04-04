//
//  SelectBox.swift
//  CleanArea
//
//  Created by 최동호 on 3/25/24.
//

import ComposableArchitecture

import SwiftUI

struct SelectBox: View {
    @Bindable var store: StoreOf<TextFieldFeature>
    
    let educationLevelOptions = ["고졸 미만", "고교 재학", "고졸 예정", "고교 졸업", "대학 재학", "대졸 예정", "대학 졸업", "석,박사", "제한없음"]
    let employmentStatusOptions = ["재직자", "자영업자", "미취업자", "프리랜서", "일용근로자", "(예비)창업자", "단기근로자", "영농종사자", "제한없음"]

    var options: [String] {
        switch store.type {
        case .employmentStatus:
            return employmentStatusOptions
            
        case .educationLevel:
            return educationLevelOptions
            
        default:
            return []
        }
    }

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    store.send(.selectText(option))
                }
            }
        } label: {
            HStack {
                Text(store.text.isEmpty ? store.type.placeholder : store.text)
                    .foregroundColor(store.text.isEmpty ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(maxHeight: 50)
            .foregroundColor(.gray)
            .background(Color(uiColor: .systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
