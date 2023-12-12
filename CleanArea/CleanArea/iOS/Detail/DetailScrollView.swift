//
//  DetailScrollView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailScrollView: View {
    @State var selectedIndex: Int = 0
    
    var youthPolicy: YouthPolicy?
    
    var body: some View {
        GeometryReader(content: { geometry in
            LazyVStack {
                ScrollViewReader(content: { proxy in
                    HStack {
                        Button {
                            withAnimation {
                                proxy.scrollTo(0, anchor: .top)
                                selectedIndex = 0
                            }
                        } label: {
                            Text("정책요약")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(selectedIndex == 0 ? Color.menuGreen : Color.menuGray)
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                proxy.scrollTo(1, anchor: .top)
                                selectedIndex = 1
                            }
                        } label: {
                            Text("신청자격")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(selectedIndex == 1 ? Color.menuGreen : Color.menuGray)
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                proxy.scrollTo(2, anchor: .top)
                                selectedIndex = 2
                            }
                        } label: {
                            Text("신청방법")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(selectedIndex == 2 ? Color.menuGreen : Color.menuGray)
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                proxy.scrollTo(3, anchor: .top)
                                selectedIndex = 3
                            }
                        } label: {
                            Text("기타")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(selectedIndex == 3 ? Color.menuGreen : Color.menuGray)
                        }
                    }
                    
                    ScrollView {
                        LazyVStack(spacing: 30) {
                            VStack {
                                DetailSummaryView(youthPolicy: youthPolicy)
                                Spacer()
                            }
                            .frame(minHeight: geometry.size.height - 20)
                            .id(0)
                            .onAppear(perform: {
                                print("0")
                                selectedIndex = 0
                            })
                            
                            VStack {
                                DetailQualificationView(youthPolicy: youthPolicy)
                                Spacer()
                            }
                            .frame(minHeight: geometry.size.height - 20)
                            .id(1)
                            .onAppear(perform: {
                                print("1")
                                selectedIndex = 1
                            })
                            
                            VStack {
                                DetailWayView(youthPolicy: youthPolicy)
                                Spacer()
                            }
                            .frame(minHeight: geometry.size.height - 20)
                            .id(2)
                            .onAppear(perform: {
                                print("2")
                                selectedIndex = 2
                            })
                            
                            VStack {
                                DetailEtcView(youthPolicy: youthPolicy)
                                Spacer()
                            }
                            .frame(minHeight: geometry.size.height - 20)
                            .id(3)
                            .onAppear(perform: {
                                print("3")
                                selectedIndex = 3
                            })
                        }
                    }
                    .frame(width: geometry.size.width + 40, height: geometry.size.height - 30)
                })
                .padding(.top, 20)
            }
        })
    }
}
/*
 #Preview {
 DetailScrollView()
 }*/
