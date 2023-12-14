//
//  StartView.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import SwiftUI

struct StartView: View {
    @StateObject var vm = StartVM()
    @State private var isSearchButtonTapped = false
    @State var isKeyboardViewUp = false

    var body: some View {
        NavigationStack {
            VStack {
                
                if !isKeyboardViewUp {
                    HStack {
                        Text("청정구역")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                            
                            Spacer()
                    }
                    .frame(width: 300)
                    .padding()
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.easeInOut),
                            removal: .opacity.animation(.easeInOut)
                         )
                    )
                }
                
                
                StartLocationField( type: .residence,
                                    width: 300)
                                .environmentObject(vm)
                StartTextField(text: $vm.employmentStatus,
                               type: .employmentStatus,
                               width: 300)
                                .environmentObject(vm)
                StartTextField(text: $vm.educationLevel,
                               type: .educationLevel,
                               width: 300)
                                .environmentObject(vm)
                StartTextField(text: $vm.age,
                               type: .age,
                               width: 300)
                StartTextField(text: $vm.policyName,
                               type: .policyName,
                               width: 300)
                Spacer()
                            
                if !isKeyboardViewUp {
                    Button {
                        isSearchButtonTapped = true
                    } label: {
                       
                            Text("정책검색")
                                .font(.title3)
                                .padding(.horizontal, 50)
                                .frame(height: 50)
                                .background(.buttonGreen)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    .navigationDestination(isPresented: $isSearchButtonTapped) {
                        // 이동할 뷰 (현재 임시 뷰 지정)
                        MainView(vm: self.vm)
                            .navigationBarBackButtonHidden(true)
                    }
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.easeInOut),
                            removal: .opacity.animation(.easeInOut)
                         )
                    )
                }
                                                
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
            self.isKeyboardViewUp = true
        }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)) { _ in
            self.isKeyboardViewUp = false
        }
        
    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


#Preview {
    StartView(vm: StartVM())
}


