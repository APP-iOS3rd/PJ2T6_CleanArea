//
//  LocationFeature.swift
//  CleanArea
//
//  Created by 최동호 on 3/25/24.
//

import ComposableArchitecture

import Foundation

@Reducer
struct LocationFeature {
    @ObservableState
    struct State: Equatable {
        var city: City?
        var selectedCity: City = .가평군
        var showModal = false
        var type: TextFieldType = TextFieldType.residence
        var width: Int = 0
    }
    
    enum Action {
        case selectCity(City)
        case setCity
        case showModal(Bool)
        case toggleModal
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .selectCity(selectedCity):
                state.selectedCity = selectedCity
                return .none
                
            case .setCity:
                state.city = state.selectedCity
                return .run { send in
                    await send(.toggleModal)
                }
                
            case let .showModal(showModal):
                state.showModal = showModal
                return .none
                
            case .toggleModal:
                state.showModal.toggle()
                return .none
            }
        }
    }
}
