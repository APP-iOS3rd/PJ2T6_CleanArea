//
//  StartFeature.swift
//  CleanArea
//
//  Created by 최동호 on 3/25/24.
//

import ComposableArchitecture

import Foundation

@Reducer
struct StartFeature {
    @ObservableState
    struct State: Equatable {
        var isKeyboardViewUp: Bool = false
        var result: IdentifiedArrayOf<YouthPolicy> = []
        var viewType: StartViewType = .startView
        
        var inputBox1 = LocationFeature.State(width: 300)
        var inputBox2 = TextFieldFeature.State(
            type: TextFieldType.employmentStatus,
            width: 300
        )
        var inputBox3 = TextFieldFeature.State(
            type: TextFieldType.educationLevel,
            width: 300
        )
        var inputBox4 = TextFieldFeature.State(
            type: TextFieldType.age,
            width: 300
        )
        var inputBox5 = TextFieldFeature.State(
            type: TextFieldType.policyName,
            width: 300
        )
        
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case dataResponse(IdentifiedArrayOf<YouthPolicy>)
        case keyboardDown
        case keyboardUp
        case openMain
        case searchButtonTap(City?, String, String, String, String)
        
        case inputBox1(LocationFeature.Action)
        case inputBox2(TextFieldFeature.Action)
        case inputBox3(TextFieldFeature.Action)
        case inputBox4(TextFieldFeature.Action)
        case inputBox5(TextFieldFeature.Action)
        
        case path(StackAction<Path.State, Path.Action>)
    }
    
    @Dependency(\.searchResult) var searchResult
    
    var body: some ReducerOf<Self> {
        Scope(state: \.inputBox1, action: \.inputBox1) {
            LocationFeature()
        }
        Scope(state: \.inputBox2, action: \.inputBox2) {
            TextFieldFeature()
        }
        Scope(state: \.inputBox3, action: \.inputBox3) {
            TextFieldFeature()
        }
        Scope(state: \.inputBox4, action: \.inputBox4) {
            TextFieldFeature()
        }
        Scope(state: \.inputBox5, action: \.inputBox5) {
            TextFieldFeature()
        }
        
        Reduce { state, action in
            switch action {
            case let .dataResponse(result):
                state.result = result
                return .run { send in
                    await send(.openMain)
                }
                
            case .keyboardDown:
                state.isKeyboardViewUp = false
                return .none
                
            case .keyboardUp:
                state.isKeyboardViewUp = true
                return .none
                
            case .openMain:
                state.viewType = .startView
                state.path.append(.mainScene(MainFeature.State(
                    policies: state.result
                )))
                return .none
                
            case let .searchButtonTap(residence,
                                      employmentStatus,
                                      educationLevel,
                                      age,
                                      policyName):
                state.viewType = .loading
                let residence = residence?.rawValue ?? ""
                
                var urlComponents = URLComponents(string: requestIP)
                urlComponents?.queryItems = [
                    URLQueryItem(name: "residence", value: residence),
                    URLQueryItem(name: "employmentStatus", value: employmentStatus),
                    URLQueryItem(name: "educationLevel", value: educationLevel),
                    URLQueryItem(name: "age", value: age),
                    URLQueryItem(name: "policyName", value: policyName)
                ]
                
                guard let url = urlComponents?.url else {
                    print("Invalid URL")
                    state.viewType = .startView
                    return .none
                }
                
                return .run { send in
                    try await send(.dataResponse(self.searchResult.fetch(url)))
                } catch: { error, _ in
                    print("데이터 받아오기 실패: \(error)")
                }

            case .inputBox1(_):
                return .none
                
            case .inputBox2(_):
                return .none
                
            case .inputBox3(_):
                return .none
                
            case .inputBox4(_):
                return .none
                
            case .inputBox5(_):
                return .none
                
            case let .path(action):
                switch action {
                case .element(id: _, action: .mainScene(.appearSet)):
                    return .none

                default:
                    return .none
                }
            }
            
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}

extension StartFeature {
    @Reducer
    struct Path {
        @ObservableState
        enum State: Equatable {
            case detailScene(DetailFeature.State)
            case listScene(ListFeature.State)
            case mainScene(MainFeature.State)
        }
        
        enum Action {
            case detailScene(DetailFeature.Action)
            case listScene(ListFeature.Action)
            case mainScene(MainFeature.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.detailScene, action: \.detailScene) {
                DetailFeature()
            }
            Scope(state: \.listScene, action: \.listScene) {
                ListFeature()
            }
            Scope(state: \.mainScene, action: \.mainScene) {
                MainFeature()
            }
        }
    }
}
