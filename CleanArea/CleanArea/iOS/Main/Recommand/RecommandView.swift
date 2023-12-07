//
//  RecommandView.swift
//  CleanArea
//
//  Created by 김건호 on 12/6/23.
//

import SwiftUI

struct RecommandView: View {
    @StateObject var vm = RecommandVM()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("추천정책")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.mainGreen)
                        .padding(.top, 20)
                    Spacer()
                }
                .padding()
                .frame(width: 330)

                // 추천 정책 셀을 표시하는 LazyHGrid
                LazyHGrid(rows: [GridItem(.adaptive(minimum: 85))]) {
                    ForEach(vm.recommandcellModels.indices, id: \.self) { index in
                        RecommandCell(model: $vm.recommandcellModels[index])
                    }
                }
                .onAppear {
                    vm.updateModels()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
        }
    }
}
struct RecommandCell: View {
    @Binding var model: RecommandCellModel

    var body: some View {
        NavigationLink(
            destination: destinationView(for: model.destinationKey, cellName: model.name)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        ) {
            HStack {
                Text(model.name)
                    .bold()
                    .foregroundStyle(.black)
                    .font(.system(size: 25))
                Text("\(model.count)")
                    .foregroundStyle(.gray)
                    .font(.system(size: 20))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.buttonGreen)
                    .bold()
            }
            .padding(.horizontal)
            .frame(width: 342, height: 85)
            .background(Color.backgroundGreen)
            .cornerRadius(10)
        }
    }

    @ViewBuilder
    private func destinationView(for key: String, cellName: String) -> some View {
        switch key {
        case "일자리", "주거", "교육", "복지,문화", "참여,권리":
            RecommandDetailView(modelName: cellName)
        default:
            Text("Invalid destination key")
        }
    }
}


#Preview {
    RecommandView()
}
