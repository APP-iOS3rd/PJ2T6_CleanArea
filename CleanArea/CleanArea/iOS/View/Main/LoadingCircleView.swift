//
//  LoadingCircleView.swift
//  CleanArea
//
//  Created by 최동호 on 12/12/23.
//

import SwiftUI

import SwiftUI

struct LoadingCircleView: View {
    @State private var circleRotates = [Bool](repeating: false, count: 8)
    @State private var rotateEntire = false

    var body: some View {
        ZStack {
            ForEach(0..<8) { index in
                createRectangle(index: index)
            }
        }
        .rotationEffect(.degrees(rotateEntire ? 0 : 180))
        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: rotateEntire)
        .onAppear {
            rotateEntire.toggle()
        }
    }

    func createRectangle(index: Int) -> some View {
        Rectangle()
            .foregroundColor(colorForIndex(index))
            .cornerRadius(circleRotates[index] ? 50 : 0)
            .frame(width: 20, height: 13)
            .overlay(
                circleRotates[index] ? RoundedRectangle(cornerRadius: 0).stroke(Color.white, lineWidth: 2) : RoundedRectangle(cornerRadius: 3).stroke(Color.white, lineWidth: 2)
            )
            .opacity(circleRotates[index] ? 0.5 : 1)
            .scaleEffect(circleRotates[index] ? 0.4 : 1)
            .rotationEffect(.degrees(circleRotates[index] ? 90 : -90))
            .offset(x: 0, y: 15)
            .rotationEffect(.degrees(Double(index) * 45))
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: circleRotates[index])
            .onAppear {
                circleRotates[index].toggle()
            }
    }

    func colorForIndex(_ index: Int) -> Color {
        let opacity = 1.0 - Double(index) * 0.1
        return index < 4 ? Color.buttonGreen.opacity(opacity) : Color.buttonGreen.opacity(opacity)
    }
}

#Preview {
    LoadingCircleView()
}
