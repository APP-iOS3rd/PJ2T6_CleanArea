//
//  RecommandDetailView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//
import SwiftUI
struct RecommandDetailView: View {
    var modelName: String
    var policies: [YouthPolicy]
    var residence: City?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        VStack{
            Spacer()
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.mainGreen)
                        .bold()
                        
                }
                Text(modelName)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.mainGreen)
                Spacer()
            }
            .frame(width: 330)
            .padding(.trailing, 15)
            ListView(youthPolicies: policies, tabType: .recommand, residence: residence)
        }
        .navigationBarHidden(true)
    }
}

//#Preview {
//    RecommandDetailView(modelName: "일자리")
//}
