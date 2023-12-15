//
//  LaunchScreenView.swift
//  CleanArea
//
//  Created by 최동호 on 12/14/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var animateImage = false
    @State private var showText = false
    @State private var rotationAngle = 0.0
    @State private var xOffset: CGFloat = 0.0
    @State private var yOffset: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("CleanArea")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.5)
                    .rotationEffect(Angle(degrees: rotationAngle))
                    .offset(x: xOffset, y: 0)
                    .onAppear {
                        xOffset = -geometry.size.width
                        withAnimation(Animation.easeInOut(duration: 2.5)) {
                            animateImage = true
                            rotationAngle = 360
                            xOffset = 0
                        }
                        withAnimation(Animation.easeInOut(duration: 1.0).delay(2.5)) {
                            yOffset -= 30
                        }
                        withAnimation(Animation.easeInOut(duration: 1.0).delay(3.5)) {
                            yOffset = 0
                            showText = true
                        }
                    }
                if showText {
                    Text("청정구역")
                        .font(.pretendardBlack30)
                        .foregroundColor(.mainGreen)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


#Preview {
    LaunchScreenView()
}
