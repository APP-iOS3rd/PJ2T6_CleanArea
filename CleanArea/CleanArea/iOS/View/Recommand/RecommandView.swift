//
//  RecommandView.swift
//  CleanArea
//
//  Created by 김건호 on 12/6/23.
//

import ComposableArchitecture

import SwiftUI

@Reducer
struct RecommandFeature {
    @ObservableState
    struct State: Equatable {
        var recommandcellModels: [RecommandCellModel] = []
    }
    
    enum Action {
     
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
            
        }
    }
}

struct RecommandView: View {
    @Bindable var store: StoreOf<RecommandFeature>

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(
                    store: Store(
                        initialState: HeaderFeature.State(title: "추천정책")) {
                        HeaderFeature()
                    }
                )

                Spacer()
                
                ScrollView {
                    ForEach(store.recommandcellModels.indices, id: \.self) { index in
                        NavigationLink {
                            RecommandDetailView(
                                modelName: store.recommandcellModels[index].name,
                                policies: store.recommandcellModels[index].policies
                            )
                        } label: {
                            RecommandCell(model: store.recommandcellModels[index])
                                .frame(height: 70)
                                .padding(.vertical, 11)
                                .padding(.horizontal, 20)
                        }
                    }
                }
                Spacer()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    private func RecommandCell(model: RecommandCellModel) -> some View {
        HStack {
            Text(model.name)
                .foregroundStyle(.black)
                .font(.pretendardBold25)
            Text("\(model.count)")
                .foregroundStyle(.gray)
                .font(.pretendardMedium20)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.buttonGreen)
                .bold()
        }
        .padding()
        .frame(height: 85)
        .background(Color.backgroundGreen)
        .cornerRadius(10)
    }
}
