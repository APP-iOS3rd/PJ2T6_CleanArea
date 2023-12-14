//
//  CleanStartView.swift
//  CleanArea
//
//  Created by 노주영 on 12/14/23.
//

import SwiftUI

struct CleanStartView: View {
    @StateObject var vm = StartVM()
    
    @State var isHidden = true
    @State var text: String = "거주지를 선택해주세요"
    
    var body: some View {
        ZStack {
            Color.backgroundGreen.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("청정구역")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color.mainGreen)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("🔍")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.mainGreen)
                    })
                }
                .frame(width: UIScreen.main.bounds.width - 40)
                .padding(.top, 20)
                
                HStack {
                    Image("CleanImage")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    TypingAnimationView(fullText: text, speed: 0.1, onCompleted: {
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                            isHidden = false
                        }
                    })
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 40)
                
                if !isHidden {
                    LocationSelectView()
                        .environmentObject(vm)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CleanStartView()
}
