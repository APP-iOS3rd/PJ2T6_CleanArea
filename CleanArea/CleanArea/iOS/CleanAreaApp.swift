//
//  CleanAreaApp.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/07.
//
import ComposableArchitecture

import SwiftUI
import SwiftData

@main
struct CleanAreaApp: App {
    
    static let store = Store(initialState: StartFeature.State()) {
        StartFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: CleanAreaApp.store
            )
                .environmentObject(LikedStatusManager())
        }
        .modelContainer(for: YouthPolicy.self)
    }
}
