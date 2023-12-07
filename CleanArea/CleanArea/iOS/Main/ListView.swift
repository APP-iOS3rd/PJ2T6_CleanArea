//
//  ListView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var vm = ListVM()
    var tabType: TabType
    
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
                
                List {
                    ForEach(currentItems, id: \.sequenceNumber) { item in
                        ZStack(alignment: .leading) {
                            PolicyListItemView(sequenceNumber: item.sequenceNumber,
                                               polyBizSjnm: item.polyBizSjnm,
                                               progress: item.progress,
                                               bizPrdCn: item.bizPrdCn,
                                               remainDate: item.remainDate,
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
        case .hot:
            return vm.popularPolicyItems
        case .like:
            return vm.likePolicyItems
        case .recommand:
            return vm.recommandPolicyItems
        }
    }
}

struct PolicyListItemView: View {
    var sequenceNumber: Int?
    var polyBizSjnm: String
    var progress: String
    var bizPrdCn: String
    var remainDate: String
    var polyCategory: String

    @State private var isLike: Bool = false


    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if (sequenceNumber != nil) {
                    HStack{
                        Text("\(sequenceNumber!)")
                            .font(.system(size: 20))
                        Text(polyBizSjnm)
                            .font(.system(size: 20))
                    }
                } else {
                    Text(polyBizSjnm)
                        .font(.system(size: 20))
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(progressColor)
                            .frame(width: 70, height: 25)

                        Text(progressText)
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(.white)

                    }
                    .padding(.leading, 10)

                    VStack {
                        Text(bizPrdCn)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        Text(remainDate)
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                    }
                }
            }
            Spacer()
            
            VStack {
                Button(action: {
                    isLike.toggle()
                }) {
                    Image(systemName: isLike ? "star.fill" : "star")
                        .foregroundColor(.buttonGreen)
                        .font(.system(size: 20))
                }
                .padding(2)
                
                Text(polyCategory)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.backgroundGreen)
        .cornerRadius(10)
        
    }
    
    
    private var progressColor: Color {
        switch progress {
        case "allTimes":
            return Color.allTimes
        case "deadline":
            return Color.deadline
        default:
            return Color.proceed
        }
    }
    
    private var progressText: String {
        switch progress {
        case "allTimes":
            return "상시"
        case "deadline":
            return "마감임박"
        default:
            return "진행중"
        }
    }
}


#Preview {
    ListView(tabType: .hot)
}

