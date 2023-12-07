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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Policy.self)
    }
}
