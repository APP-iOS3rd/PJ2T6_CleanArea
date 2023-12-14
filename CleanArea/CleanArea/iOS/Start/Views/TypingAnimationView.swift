//
//  TypingAnimationView.swift
//  CleanArea
//
//  Created by 노주영 on 12/14/23.
//

import SwiftUI

struct TypingAnimationView: View {
    let fullText: String
    let speed: TimeInterval
    var onCompleted: () -> Void
    @State private var displayedText = ""
    
    var body: some View {
        Text(displayedText)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.mainGreen)
            .onAppear {
                Task {
                    await displayText()
                }
            }
    }
    
    func displayText() async {
        let arr = fullText.map{String($0)}
        do {
            for i in 0..<arr.count {
                try await Task.sleep(nanoseconds: UInt64(speed * 1_000_000_000))
                self.displayedText += arr[i]
            }
            onCompleted()
        } catch {
            print("오류")
        }
    }
}
