//
//  CleanAreaApp.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import SwiftUI
import SwiftData

@main
struct CleanAreaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: YouthPolicy.self)
    }
}
