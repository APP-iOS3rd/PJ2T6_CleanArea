//
//  StarBtn.swift
//  CleanArea
//
//  Created by 이민호 on 12/6/23.
//
import SwiftUI
import SwiftData

// LikedStatusManager 클래스
class LikedStatusManager: ObservableObject {
    @Published var likedStatus: [String: Bool] = [:]

    init() {
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            if key.starts(with: "isLiked_") {
                let policyID = String(key.dropFirst("isLiked_".count))
                if let status = value as? Bool {
                    likedStatus[policyID] = status
                }
            }
        }
    }

    func setLikedStatus(for policyID: String, status: Bool) {
        likedStatus[policyID] = status
        UserDefaults.standard.set(status, forKey: "isLiked_\(policyID)")
    }

    func getLikedStatus(for policyID: String) -> Bool {
        return likedStatus[policyID] ?? UserDefaults.standard.bool(forKey: "isLiked_\(policyID)")
    }
}

// StarBtn 구조체
struct StarBtn: View {
    @EnvironmentObject var likedStatusManager: LikedStatusManager
    @Environment(\.modelContext) var modelContext
    var policy: YouthPolicy

    var body: some View {
        Button {
            let currentStatus = likedStatusManager.getLikedStatus(for: policy.bizId)
            likedStatusManager.setLikedStatus(for: policy.bizId, status: !currentStatus)

            if !currentStatus {
                modelContext.insert(policy)
            } else {
                modelContext.delete(policy)
            }
        } label: {
            Image(systemName: likedStatusManager.getLikedStatus(for: policy.bizId) ? "star.fill" : "star")
                .foregroundColor(.buttonGreen)
                .imageScale(.large)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// UserDefaults 확장
//extension UserDefaults {
//    func setLikedStatus(for policyID: String, status: Bool) {
//        set(status, forKey: "isLiked_\(policyID)")
//    }
//
//    func getLikedStatus(for policyID: String) -> Bool {
//        return bool(forKey: "isLiked_\(policyID)")
//    }
//}


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
