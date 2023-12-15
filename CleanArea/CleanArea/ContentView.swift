//
//  ContentView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/07.
//

import SwiftUI

struct ContentView: View {
    @State private var showLaunchScreen = true

    var body: some View {
        Group {
            if showLaunchScreen {
                LaunchScreenView()
                    .onAppear {
                        Task {
                            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
                            withAnimation {
                                showLaunchScreen = false
                            }
                        }
                    }
            } else {
                StartView()
            }
        }
    }
}

#Preview {
    ContentView()
}
