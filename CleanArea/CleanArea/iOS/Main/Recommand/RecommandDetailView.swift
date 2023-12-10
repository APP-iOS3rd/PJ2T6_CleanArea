//
//  RecommandDetailView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("정책이름을 검색해 주세요", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if text != "" {
                            Button(action: {
                                self.text = ""
                                hideKeyboard()
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .frame(width: 342)
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct RecommandDetailView: View {
    @State private var searchText = ""
    var modelName: String
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            VStack() {
                
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
                    SearchBar(text: $searchText)
                
                
                Spacer()
                            
                ListView(tabType: .recommand)
                    .background(NavigationLink(
                        destination: EmptyView(),
                        label: { EmptyView() }
                    ))            
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RecommandDetailView(modelName: "일자리")
}
