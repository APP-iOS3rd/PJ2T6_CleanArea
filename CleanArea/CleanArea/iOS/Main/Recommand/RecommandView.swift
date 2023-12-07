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
        VStack{
            HStack{
                Text("추천정책")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.mainGreen)
                    .padding(.top, 20)
                Spacer()
            }
            .padding()
            .frame(width: 330)
            
            NavigationView {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: 85))]) {
                    ForEach(vm.recommandcellModels.indices, id: \.self) { index in
                        RecommandCell(model: $vm.recommandcellModels[index])
                    }
                }
                .onAppear {
                    vm.updateModels()
                }
            }
            Spacer()
        }
    }
}

struct RecommandCell : View {
    @Binding var model : RecommandCellModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        NavigationLink(destination: destinationView(for: model.destinationKey)) {
            
            HStack{
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
    private func destinationView(for key: String) -> some View {
        VStack{
            switch key {
            case "일자리":
                RecommandDetailView()
            case "주거":
                RecommandDetailView()
            case "교육":
                RecommandDetailView()
            case "복지,문화":
                RecommandDetailView()
            case "참여,권리":
                RecommandDetailView()
                
            default:
                Text("Invalid destination key")
            }
        }
    }

}

#Preview {
    RecommandView()
}
