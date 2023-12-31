//
//  DetailView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var apiViewModel: APIViewModel
    var cityImage: City?                            //시 이미지
    var youthPolicy: YouthPolicy                    //정책 내용
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .bold()
                        .foregroundStyle(.mainGreen)
                }
                Spacer()
                
                //TODO: 스타버튼
                StarBtn(policy: youthPolicy)
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            HStack {
                Text(youthPolicy.polyBizSjnm)
                    .multilineTextAlignment(.leading)
                    .font(.pretendardSemiBold25)
                    .foregroundStyle(.mainGreen)
                
                Spacer()
                
                Image(City(rawValue: youthPolicy.polyBizSecd)?.getCityImage() ?? "")
                 .resizable()
                 .frame(width: 90, height: 60)
                 .cornerRadius(10)
                 .background(
                     Rectangle()
                         .cornerRadius(10)
                         .foregroundStyle(.white)
                         .shadow(color: Color(uiColor: UIColor.systemGray), radius: 1)
                 )
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
            
            DetailScrollView(youthPolicy: youthPolicy)
        }
        .onAppear{
            apiViewModel.incrementViews(for: youthPolicy.bizId)
        }
        .navigationBarBackButtonHidden()
    }
}

/*
 #Preview {
 DetailView()
 }
 */
