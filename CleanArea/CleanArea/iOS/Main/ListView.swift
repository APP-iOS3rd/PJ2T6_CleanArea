//
//  ListView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import SwiftUI

struct ListView: View {
    var policyItems: [PolicyItem]
        var tabType: TabType
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack{
                if tabType == .hot {
                    HStack{
                        Text("인기정책")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                        Spacer()
                    }
                    .frame(width: 330)
                    .padding()
                } else if tabType == .like {
                    HStack{
                        Text("즐겨찾기")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.mainGreen)
                            .padding(.top, 20)
                        Spacer()
                    }
                    .frame(width: 330)
                    .padding()
                }
                if tabType == .recommand {
                    SearchBar(text: $searchText)
                        .padding(.horizontal)
                }
                List {
                    ForEach(currentItems, id: \.sequenceNumber) { item in
                        ZStack(alignment: .leading) {
                            ListItemView(sequenceNumber: item.sequenceNumber,
                                               polyBizSjnm: item.polyBizSjnm,
                                               bizPrdCn: item.bizPrdCn,
                                               polyCategory: item.polyCategory)
                            NavigationLink(destination: DetailView()) {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical, 8)
                    }
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
            }
        }
    }
    
    private var currentItems: [PolicyItem] {
            switch tabType {
            case .hot, .like:
                return policyItems
            case .recommand:
                return policyItems.filter { item in
                    searchText.isEmpty || item.polyBizSjnm.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


#Preview {
    ListView(policyItems: recommandPolicyItems, tabType: .hot)
}



