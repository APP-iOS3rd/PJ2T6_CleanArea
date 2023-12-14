//
//  ListView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import SwiftUI

struct ListView: View {
    var youthPolicies: [YouthPolicy]
    var tabType: TabType
    var residence: City?
    @State private var searchText = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject  var vm: APIViewModel
    
    
    var body: some View {
        NavigationStack {
            VStack {
                switch tabType {
                case .hot, .like:
                    HeaderView(title: tabType == .hot ? "인기정책" : "즐겨찾기", action:{ self.presentationMode.wrappedValue.dismiss()})

                case .recommand:
                    SearchBar(text: $searchText)
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
                .onAppear{
                    vm.search()
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
              // 'like' 탭에 대한 로직 (원래 로직을 유지)
              return youthPolicies
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



