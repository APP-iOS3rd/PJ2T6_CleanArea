//
//  StartView.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import SwiftUI

struct StartView: View {
    @StateObject var vm = APIViewModel()
    @State private var isSearchButtonTapped = false
    @State var isKeyboardViewUp = false

    var body: some View {
        NavigationStack {
            VStack {
                if !isKeyboardViewUp {
                    HStack(spacing: 5) {
                        Image("CleanArea")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .padding(.leading, -6)
                        
                        Text("청정구역")
                            .font(.pretendardBold30)
                            .foregroundStyle(.mainGreen)
                            Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.easeInOut),
                            removal: .opacity.animation(.easeInOut)
                         )
                    )
                }
                Spacer()
                
                if !isKeyboardViewUp {
                    StartLocationField(type: .residence,
                                        width: 300)
                                    .environmentObject(vm)
                                    .transition(
                                        .asymmetric(
                                            insertion: .opacity.animation(.easeInOut),
                                            removal: .opacity.animation(.easeInOut)
                                         )
                                    )
                }
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
                                .font(.pretendardRegular25)
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
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .onTapGesture {
                UIApplication.shared.closeKeyboard()
            }
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
    StartView()
}


