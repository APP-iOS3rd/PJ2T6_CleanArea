//
//  DetailView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailView: View {
    var cityImage: City?                          //시 이미지
    var sphere: String?                              //분야
    var youthPolicy: YouthPolicy?                    //정책 내용
    
    @State var isFavorite: Bool = false              //나중에 뷰 모델에서 @Published 변수로 변경
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 17, height: 22)
                    .foregroundStyle(Color.init(hex: "1E482D"))
                
                Spacer()
                
                //TODO: 스타버튼
                //StarBtn(policy: <#T##YouthPolicy#>)
                
                Button(action: {
                    //TODO: 즐겨찾기 swiftData랑 연동해야됨
                    isFavorite.toggle()
                }, label: {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.buttonGreen)
                })
            }
            
            HStack {
                Text(youthPolicy?.polyBizSjnm ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundStyle(.mainGreen)
                
                Spacer()
                
                Image(cityImage.getCityImage())
                 .resizable()
                 .frame(width: 90, height: 60)
                 .cornerRadius(10)
                 .background(
                     Rectangle()
                         .cornerRadius(10)
                         .foregroundStyle(.backgroundGreen)
                         .shadow(color: Color(uiColor: UIColor.systemGray), radius: 1)
                 )
            }
            .padding(.top)
            
            DetailScrollView(youthPolicy: youthPolicy)
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

/*
 color
 뒤로가기 = 1E482D
 제목 = 1E482D
 빈 별 = 64A37B
 
 버튼 = 8AC49F
 큹x = 9A9A9A
 태그 = E1F1E1
 */
 #Preview {
 DetailView()
 }
