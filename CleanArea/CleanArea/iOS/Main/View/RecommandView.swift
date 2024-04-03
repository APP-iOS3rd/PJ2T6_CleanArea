//
//  RecommandView.swift
//  CleanArea
//
//  Created by 김건호 on 12/6/23.
//

import ComposableArchitecture

import SwiftUI

struct RecommandView: View {
    @Bindable var store: StoreOf<RecommandFeature>
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(store.recommandcellModels.indices, id: \.self) { index in
                    NavigationLink(state: StartFeature.Path.State.listScene(.init(
                        filteredPolicies: store.recommandcellModels[index].policies, 
                        hearderTitle: store.recommandcellModels[index].name, 
                        policies: store.recommandcellModels[index].policies,
                        tabType: .recommand))) {
                        RecommandCell(model: store.recommandcellModels[index])
                            .frame(height: 70)
                            .padding(.vertical, 11)
                            .padding(.horizontal, 20)
                    }
                }
            }
            Spacer()
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
