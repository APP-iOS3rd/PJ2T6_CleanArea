//
//  StarBtn.swift
//  CleanArea
//
//  Created by 이민호 on 12/6/23.
//

import ComposableArchitecture

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
    
    @Dependency(\.swiftData) var swiftData

    func setLikedStatus(for policyID: String, status: Bool) {
        likedStatus[policyID] = status
        UserDefaults.standard.set(status, forKey: "isLiked_\(policyID)")
    }

    func getLikedStatus(for policyID: String) -> Bool {
        return likedStatus[policyID] ?? UserDefaults.standard.bool(forKey: "isLiked_\(policyID)")
    }
}


@Reducer
struct StarFeature {
    @ObservableState
    struct State: Equatable {
        var likedStatus: [String: Bool] = [:]
        var policy: YouthPolicy

    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            
            return .none
        }
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
