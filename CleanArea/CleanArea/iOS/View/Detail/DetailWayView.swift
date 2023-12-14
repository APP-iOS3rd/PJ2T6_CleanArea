//
//  DetailWayView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailWayView: View {
    @State var isModaling: Bool = false

    var youthPolicy: YouthPolicy?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("🤔 신청방법")
                    .font(.pretendardSemiBold20)
                    .foregroundStyle(.mainGreen)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding(.top, 30)
            
            ForEach(0..<4){ index in
                let choose = chooseTitle(index)
                
                if index == 2 && String(choose.1.prefix(4)) == "http" {
                    HStack {
                        Text(choose.0)
                            .modifier(DetailSemiTitleModifier())
                        Spacer()
                        Text("\(String(isModaling))")
                            .foregroundStyle(.isModal)
                    }
                    
                    Button(action: {
                        isModaling.toggle()
                    }, label: {
                        Text(choose.1)
                            .multilineTextAlignment(.leading)
                            .font(.pretendardBold17)
                            .foregroundStyle(.blue)
                    })
                    .fullScreenCover(isPresented: $isModaling) {
                        WebSiteView(url: choose.1, isModaling: $isModaling)
                    }
                } else {
                    Text(choose.0)
                        .modifier(DetailSemiTitleModifier())
                    
                    Text(choose.1)
                        .modifier(DetailSemiContentModifier())
                        .padding(.top, -10)
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    private func chooseTitle(_ index: Int) -> (String, String){
        switch index {
        case 0: return ("신청절차", youthPolicy?.rqutProcCn ?? "")
        case 1: return ("심사 및 발표", youthPolicy?.jdgnPresCn ?? "")
        case 2: return ("신청 사이트", youthPolicy?.rqutUrla ?? "-")
        case 3: return ("제출 서류", youthPolicy?.pstnPaprCn ?? "")
        default: return ("","")
        }
    }
}

/*
 #Preview {
 DetailWayView()
 }*/
