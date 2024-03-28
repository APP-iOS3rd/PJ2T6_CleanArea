//
//  ListItemView.swift
//  CleanArea
//
//  Created by 최동호 on 12/11/23.
//

import ComposableArchitecture

import SwiftUI

struct ListItemView: View {

    @Bindable var store: StoreOf<ListItemFeature>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(store.policy.polyBizSjnm)
                    .font(.pretendardRegular20)
                    .foregroundStyle(.black)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(store.progressColor)
                            .frame(width: 70, height: 25)
                        
                        Text(store.currentProgress)
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(.white)
                    }
                    
                    if store.currentProgress != "마감" && store.dDayText != "" {
                        HStack{
                            Text(store.dDayText)
                                .font(.pretendardRegular13)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
            
            VStack {
                StarBtn(policy: store.policy)
                    .padding(2)
                
                Text(store.category)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(width: UIScreen.main.bounds.width * 0.2)
            }
        }
        .padding()
        .background(Color.backgroundGreen)
        .cornerRadius(10)
        .onAppear{
            store.send(.appearSet(store.policy))
        }
    }
}

