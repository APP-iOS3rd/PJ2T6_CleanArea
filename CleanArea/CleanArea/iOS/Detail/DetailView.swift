//
//  DetailView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import ComposableArchitecture

import SwiftUI

@Reducer
struct DetailFeature {
    @ObservableState
    struct State: Equatable {
        var cityImage: City?                            //시 이미지
        var youthPolicy: YouthPolicy                    //정책 내용
    }
    
    enum Action {
        case tabBackButton
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .tabBackButton:
                return .run { _ in
                    await self.dismiss()
                }
            }
        }
    }
}

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
                StarBtn(policy: store.youthPolicy)
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
        .navigationBarBackButtonHidden()
    }
}

/*
 #Preview {
 DetailView()
 }
 */
