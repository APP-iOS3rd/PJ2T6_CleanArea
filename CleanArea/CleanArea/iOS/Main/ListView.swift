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
    
    var body: some View {
        NavigationView {
            VStack {
                switch tabType {
                case .hot:
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .bold()
                                .foregroundStyle(.mainGreen)
                                .padding(.top, 20)
                        }
                        Text("인기정책")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                        Spacer()
                    }
                    .frame(width: 330)
                    .padding()

                case .like:
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .bold()
                                .foregroundStyle(.mainGreen)
                                .padding(.top, 20)
                        }
                        Text("즐겨찾기")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                        Spacer()
                    }
                    .frame(width: 330)
                    .padding()

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
          case .hot, .like:
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



