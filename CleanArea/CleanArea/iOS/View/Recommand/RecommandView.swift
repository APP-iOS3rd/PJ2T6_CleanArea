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
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm = RecommandVM(apiViewModel: APIViewModel())
    
    @EnvironmentObject var apiViewModel: APIViewModel

    var residence: City?

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
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(vm.recommandcellModels.indices, id: \.self) { index in
                        RecommandCell(model: $vm.recommandcellModels[index], residence: residence)
                        .frame(height: 70)
                        .padding(.bottom, 22)
                        .padding(.horizontal, 20)
                    }
                }
                Spacer()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct RecommandCell: View {
    @Binding var model: RecommandCellModel
    var residence: City?
    
    var body: some View {
        NavigationLink(
            destination: destinationView(for: model.destinationKey, cellName: model.name)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        ) {
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
    
    @ViewBuilder
    private func destinationView(for key: String, cellName: String) -> some View {
        switch key {
        case "일자리", "주거", "교육", "복지,문화", "참여,권리":
            RecommandDetailView(modelName: cellName, policies: model.policies, residence: residence)
        default:
            Text("Invalid destination key")
        }
    }
}
