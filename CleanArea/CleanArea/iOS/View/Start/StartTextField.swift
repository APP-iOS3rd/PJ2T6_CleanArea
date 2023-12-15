//
//  StartTextField.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import Foundation
import SwiftUI

struct StartTextField: View {
    @EnvironmentObject var vm: APIViewModel
    @Binding var text: String
    
    var type: TextFieldType
    var width: Int

    var body: some View {
        VStack {
            HStack {
                Text(type.title)
                    .font(.pretendardRegular20)
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 10)
                Spacer()
            }
            .frame(maxWidth: .infinity)

            if type.isSelectable {
                SelectBox(text: $text, type: type, width: width)
            } else {
                switch type {
                case .age:
                    TextField(type.placeholder, text: $text)
                        .commonTextFieldStyle(width: CGFloat(width), keyboardType: .decimalPad)

                case .policyName:
                    TextField(type.placeholder, text: $text)
                        .commonTextFieldStyle(width: CGFloat(width))
                default:
                    fatalError("error")
                }
            }
        }
    }
}

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


struct SelectBox: View {
    @EnvironmentObject var vm: APIViewModel
    @Binding var text: String
    
    var type: TextFieldType
    var width: Int

    var options: [String] {
        switch type {
        case .employmentStatus:
            return vm.employmentStatusOptions
        case .educationLevel:
            return vm.educationLevelOptions
        default:
            return []
        }
    }

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    text = option
                }
            }
        } label: {
            HStack {
                Text(text.isEmpty ? type.placeholder : text)
                    .foregroundColor(text.isEmpty ? .gray : .black)
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




