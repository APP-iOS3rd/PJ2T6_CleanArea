//
//  DetailView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import ComposableArchitecture

import SwiftUI

struct DetailView: View {
    
    @Bindable var store: StoreOf<DetailFeature>
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    store.send(.tabBackButton)
                }) {
                    Image(systemName: "chevron.left")
                        .bold()
                        .foregroundStyle(.mainGreen)
                }
                Spacer()
                
                //TODO: 스타버튼
                Button {
                    store.send(.tabStarButton)
                } label: {
                    Image(systemName: store.likeStatus ? "star.fill" : "star")
                        .foregroundColor(.buttonGreen)
                        .imageScale(.large)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            HStack {
                Text(store.youthPolicy.polyBizSjnm)
                    .multilineTextAlignment(.leading)
                    .font(.pretendardSemiBold25)
                    .foregroundStyle(.mainGreen)
                
                Spacer()
                
                Image(City(rawValue: store.youthPolicy.polyBizSecd)?.getCityImage() ?? "")
                 .resizable()
                 .frame(width: 90, height: 60)
                 .cornerRadius(10)
                 .background(
                     Rectangle()
                         .cornerRadius(10)
                         .foregroundStyle(.white)
                         .shadow(color: Color(uiColor: UIColor.systemGray), radius: 1)
                 )
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
            
            DetailScrollView(youthPolicy: store.youthPolicy)
        }
        .onAppear {
            store.send(.onAppear)
        }
        .navigationBarBackButtonHidden()
    }
}

/*
 #Preview {
 DetailView()
 }
 */
