//
//  RecommandDetailView.swift
//  CleanArea
//
//  Created by 최동호 on 12/6/23.
//
import ComposableArchitecture

import SwiftUI

struct RecommandDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var modelName: String
    var policies: IdentifiedArrayOf<YouthPolicy>
    var residence: City?
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(
                    store: Store(
                        initialState: HeaderFeature.State(title: modelName)) {
                        HeaderFeature()
                    }
                )
         
               // ListView(store: <#StoreOf<ListFeature>#>, youthPolicies: policies, tabType: .recommand, residence: residence)
            }
            .navigationBarTitle("", displayMode: .automatic)
            .navigationBarHidden(true)
        }
    }
}
//#Preview {
//    RecommandDetailView(modelName: "일자리")
//}
