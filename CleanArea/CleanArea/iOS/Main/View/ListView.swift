//
//  ListView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import ComposableArchitecture

import SwiftData
import SwiftUI

@Reducer
struct ListFeature {
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


struct ListView: View {
    @EnvironmentObject var likedStatusManager: LikedStatusManager
    @Environment(\.presentationMode) var presentationMode
    
    @State private var searchText = ""
    
    @Query var policys : [YouthPolicy]

    var youthPolicies: [YouthPolicy]
    var tabType: TabType
    var residence: City?
    
    var body: some View {
        NavigationStack {
            VStack {
                switch tabType {
                case .hot, .like:
                    HeaderView(title: tabType == .hot ? "인기정책" : "즐겨찾기", action:{ self.presentationMode.wrappedValue.dismiss()})

                case .recommand:
                    SearchBar(
                        store: Store(initialState: SearchFeature.State()) {
                            SearchFeature()
                        }
                    )
                        .padding(.horizontal)
                }

                List {
                    ForEach(filteredPolicies, id: \.self) { policy in
                        ZStack(alignment: .leading) {
                            ListItemView(policy: policy)
                            NavigationLink(destination: DetailView(cityImage: residence, youthPolicy: policy)) {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical, 8)
                    }
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
            }
        }
    }
}

//MARK: 추천, 인기, 즐겨찾기
extension ListView {
    private var filteredPolicies: [YouthPolicy] {
          switch tabType {
          case .hot:
              // 조회수가 높은 순으로 정렬
              return youthPolicies.sorted { $0.views > $1.views }
          case .like:
              return policys
          case .recommand:
              return youthPolicies.filter { policy in
                  searchText.isEmpty || policy.polyBizSjnm.localizedCaseInsensitiveContains(searchText)
              }
          }
      }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


