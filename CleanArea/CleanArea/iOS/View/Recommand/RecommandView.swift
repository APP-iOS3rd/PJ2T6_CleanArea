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
        var policies: [YouthPolicy]
        var recommandcellModels: [RecommandCellModel] = []
        var job: [YouthPolicy] = []
        var residence: [YouthPolicy] = []
        var education: [YouthPolicy] = []
        var curture: [YouthPolicy] = []
        var participation: [YouthPolicy] = []
    }
    
    enum Action {
        case appearSet
        case distributeModel
        case setRecommanModel([YouthPolicy], String)
        case getPolicy
        case filterPolicy([YouthPolicy], Field)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            
            switch action {
            case .appearSet:
                return .run { send in
                    await send(.getPolicy)
                    await send(.distributeModel)
                }
                
            case .distributeModel:
                return .run {
                    [job = state.job,
                     residence = state.residence,
                     education = state.education,
                     curture = state.curture,
                     participation = state.participation] send in
                    
                    await send(.setRecommanModel(job, "일자리"))
                    await send(.setRecommanModel(residence, "주거"))
                    await send(.setRecommanModel(education, "교육"))
                    await send(.setRecommanModel(curture, "복지,문화"))
                    await send(.setRecommanModel(participation, "참여,권리"))
                }
        
            case let .setRecommanModel(policies, name):
                let jobModel =  RecommandCellModel(name: name, count: policies.count, destinationKey: name, policies: policies)
                state.recommandcellModels.append(jobModel)

                return .none
            
            case .getPolicy:
                return .run { [policies = state.policies] send in
                    await send(.filterPolicy(policies, Field.job))
                    await send(.filterPolicy(policies, Field.residence))
                    await send(.filterPolicy(policies, Field.education))
                    await send(.filterPolicy(policies, Field.curture))
                    await send(.filterPolicy(policies, Field.participation))
                }
                
            case let .filterPolicy(policies, code):
                switch code {
                case .job:
                    state.job += policies.filter {  $0.polyRlmCd == code.rawValue }
                case .residence:
                    state.residence += policies.filter {  $0.polyRlmCd == code.rawValue }
                case .education:
                    state.education += policies.filter {  $0.polyRlmCd == code.rawValue }
                case .curture:
                    state.curture += policies.filter {  $0.polyRlmCd == code.rawValue }
                case .participation:
                    state.participation += policies.filter {  $0.polyRlmCd == code.rawValue }
                }
                return .none
            }
        }
    }
}

struct RecommandView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm = RecommandVM(apiViewModel: APIViewModel())
    
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
                        .padding(.bottom, 22)
                        .padding(.horizontal, 20)
                    }
                }
                Spacer()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .onAppear {
            store.send(.appearSet)
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
