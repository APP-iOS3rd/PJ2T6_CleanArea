//
//  CleanAreaApp.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/07.
//

import SwiftUI
import SwiftData

@main
struct CleanAreaApp: App {
    var likedStatusManager = LikedStatusManager()

    var body: some Scene {
        WindowGroup {
            CleanStartView(vm: StartVM())
                .environmentObject(likedStatusManager)
           // StartView(vm: StartVM())
             //   .environmentObject(likedStatusManager)
        }
        .modelContainer(for: YouthPolicy.self)
    }
}
