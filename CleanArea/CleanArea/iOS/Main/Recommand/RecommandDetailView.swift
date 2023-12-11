//
//  RecommandDetailView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//
import SwiftUI
struct RecommandDetailView: View {
    var modelName: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.buttonGreen)
                        .bold()
                }
                Text(modelName)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.mainGreen)
                Spacer()
            }
            .frame(width: 330)
            .padding()
            Spacer()
            ListView(tabType: .recommand)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    RecommandDetailView(modelName: "일자리")
}
