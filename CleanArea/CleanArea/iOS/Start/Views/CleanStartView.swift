//
//  CleanStartView.swift
//  CleanArea
//
//  Created by 노주영 on 12/14/23.
//

import SwiftUI

struct CleanStartView: View {
    @StateObject var vm = StartVM()
    
    @State var isHiddenLocation = false
    @State var isHiddenEmployment = true
    @State var isHiddenEducation = true
    
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
                
                ZStack {
                    if !isHiddenLocation {
                        LocationSelectView(isHiddenLocation: $isHiddenLocation, isHiddenEmployment: $isHiddenEmployment)
                            .environmentObject(vm)
                    }
                    
                    if !isHiddenEmployment {
                        EmploymentSelectView(isHiddenEmployment: $isHiddenEmployment, isHiddenEducation: $isHiddenEducation)
                            .environmentObject(vm)
                    }
                    
                    if !isHiddenEducation {
                        EducationSelectView(isHiddenEducation: $isHiddenEducation)
                            .environmentObject(vm)
                    }
                }
                .padding(.top, 20)
                
                Spacer()
            }
        }
    }
}

#Preview {
    CleanStartView()
}
