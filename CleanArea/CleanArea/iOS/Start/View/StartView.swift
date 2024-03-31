//
//  StartView.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import ComposableArchitecture

import SwiftUI

struct StartView: View {
    @Bindable var store: StoreOf<StartFeature>
    
    var body: some View {
        switch store.viewType {
        case .startView:
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                VStack {
                    if !store.isKeyboardViewUp {
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
                    
                    if !store.isKeyboardViewUp {
                        StartLocationField(store: store.scope(state: \.inputBox1, action: \.inputBox1))
                            .transition(
                                .asymmetric(
                                    insertion: .opacity.animation(.easeInOut),
                                    removal: .opacity.animation(.easeInOut)
                                )
                            )
                    }
                    
                    StartTextField(store: store.scope(state: \.inputBox2, action: \.inputBox2))
                    
                    StartTextField(store: store.scope(state: \.inputBox3, action: \.inputBox3))
                    
                    StartTextField(store: store.scope(state: \.inputBox4, action: \.inputBox4))
                    
                    StartTextField(store: store.scope(state: \.inputBox5, action: \.inputBox5))
                    
                    Spacer()
                    
                    
                    if !store.isKeyboardViewUp {
                        Button {
//                            store.send(.searchButtonTap(
//                                store.scope(state: \.inputBox1, action: \.inputBox1).city,
//                                store.scope(state: \.inputBox2, action: \.inputBox2).text,
//                                store.scope(state: \.inputBox3, action: \.inputBox3).text,
//                                store.scope(state: \.inputBox4, action: \.inputBox4).text,
//                                store.scope(state: \.inputBox5, action: \.inputBox5).text
//                            ))
                            store.send(.openMain)
                        } label: {
                            
                            Text("정책검색")
                                .font(.pretendardRegular25)
                                .padding(.horizontal, 50)
                                .frame(height: 50)
                                .background(.buttonGreen)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
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
                    hideKeyboard()
                }
                .onAppear {
                    print(store.path)
                }
            } destination: { store in
                switch store.state {
                case .mainScene:
                    if let store = store.scope(state: \.mainScene, action: \.mainScene) {
                        MainView(store: store)
                    }
                case .listScene(_):
                    if let store = store.scope(state: \.listScene, action: \.listScene) {
                        ListView(store: store)
                    }
                case .detailScene(_):
                    if let store = store.scope(state: \.detailScene, action: \.detailScene) {
                        DetailView(store: store)
                    }
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
                store.send(.keyboardUp)
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)) { _ in
                store.send(.keyboardDown)
            }
            
        case .loading:
            LoadingCircleView()
        }
    }
}

