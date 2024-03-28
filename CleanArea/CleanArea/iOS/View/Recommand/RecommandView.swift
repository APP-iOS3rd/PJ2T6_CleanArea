//
//  RecommandView.swift
//  CleanArea
//
//  Created by 김건호 on 12/6/23.
//

import ComposableArchitecture

import SwiftUI

enum Field: String {
    case job = "023010"
    case residence = "023020"
    case education = "023030"
    case curture = "023040"
    case participation = "023050"
}


@Reducer
struct RecommandFeature {
    @ObservableState
    struct State: Equatable {
        var recommandcellModels: [RecommandCellModel]
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
                        RecommandCell(model: store.recommandcellModels[index])
                        .frame(height: 70)
                        .padding(.vertical, 11)
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
    var model: RecommandCellModel
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
