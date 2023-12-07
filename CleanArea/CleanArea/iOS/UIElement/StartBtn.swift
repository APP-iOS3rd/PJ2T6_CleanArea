//
//  StarBtn.swift
//  CleanArea
//
//  Created by 이민호 on 12/6/23.
//

import SwiftUI
import SwiftData

struct StarBtn: View {
    @Environment(\.modelContext) var modelContext
    @State private var isClicked = false
    var policy: YouthPolicy

    var body: some View {
        Button {
            isClicked.toggle()
            
            if isClicked {
                modelContext.insert(policy)
            } else {
                modelContext.delete(policy)
            }
        } label: {
            Image(systemName: isClicked ? "star.fill" : "star")
                .foregroundColor(Color(hex: "64A37B")) // 이미지 색상을 설정할 수 있습니다.
                .imageScale(.large)
        }
    }
}


//extension Color {
//    init(hex: String) {
//        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
//        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
//
//        var rgb: UInt64 = 0
//
//        Scanner(string: hexSanitized).scanHexInt64(&rgb)
//
//        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
//        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
//        let blue = Double(rgb & 0x0000FF) / 255.0
//
//        self.init(red: red, green: green, blue: blue)
//    }
//}

//#Preview {
//    StarBtn()
//    //policy: YouthPolicy(rnum: 1, polyBizTy: "4309" , polyBizSjnm: "국민취업정책", rqutUrla: "www.url.com")
//}
