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
            VStack {
                //ScrollViewReader(content: { proxy in
                    HStack {
                        Button {
                            withAnimation {
                                selectedIndex = 0
                            }
                        } label: {
                            Text("정책요약")
                                .font(.pretendardSemiBold17)
                                .foregroundStyle(selectedIndex == 0 ? Color.menuGreen : Color.menuGray)
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                selectedIndex = 1
                            }
                        } label: {
                            Text("신청자격")
                                .font(.pretendardSemiBold17)
                                .foregroundStyle(selectedIndex == 1 ? Color.menuGreen : Color.menuGray)
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                selectedIndex = 2
                            }
                        } label: {
                            Text("신청방법")
                                .font(.pretendardSemiBold17)
                                .foregroundStyle(selectedIndex == 2 ? Color.menuGreen : Color.menuGray)
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                selectedIndex = 3
                            }
                        } label: {
                            Text("기타")
                                .font(.pretendardSemiBold17)
                                .foregroundStyle(selectedIndex == 3 ? Color.menuGreen : Color.menuGray)
                        }
                    }
                    .padding(.horizontal, 20)
                
                ScrollView {
                    if selectedIndex == 0 {
                        DetailSummaryView(youthPolicy: youthPolicy)
                            .frame(width: UIScreen.main.bounds.width)
                        Spacer()
                    } else if selectedIndex == 1 {
                        DetailQualificationView(youthPolicy: youthPolicy)
                            .frame(width: UIScreen.main.bounds.width)
                        Spacer()
                    } else if selectedIndex == 2 {
                        DetailWayView(youthPolicy: youthPolicy)
                            .frame(width: UIScreen.main.bounds.width)
                        Spacer()
                    } else if selectedIndex == 3 {
                        DetailEtcView(youthPolicy: youthPolicy)
                            .frame(width: UIScreen.main.bounds.width)
                        Spacer()
                    }
                }
                .padding(.bottom, 30)
            }
            .padding(.top, 20)
        })
    }
}
/*
 #Preview {
 DetailScrollView()
 }*/
