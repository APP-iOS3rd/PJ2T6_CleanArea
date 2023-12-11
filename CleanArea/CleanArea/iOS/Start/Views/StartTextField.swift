//
//  StartTextField.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import Foundation
import SwiftUI

struct StartTextField: View {
    @EnvironmentObject var vm: StartVM
    @Binding var text: String
    
    var type: TextFieldType
    var width: Int

    var body: some View {
        VStack {
            HStack {
                Text(type.title)
                    .font(.headline)
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 10)
                Spacer()
            }
            .frame(width: CGFloat(width))

            if type.isSelectable {
                SelectBox(text: $text, type: type, width: width)
            } else {
                TextField(type.placeholder, text: $text)
                    .padding()
                    .bold()
                    .frame(width: CGFloat(width))
                    .frame(height: 45)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

struct SelectBox: View {
    @EnvironmentObject var vm: StartVM
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
            .frame(width: CGFloat(width), height: 45)
            .foregroundColor(.gray)
            .background(Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
