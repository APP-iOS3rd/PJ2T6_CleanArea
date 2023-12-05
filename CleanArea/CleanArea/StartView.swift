//
//  StartView.swift
//  CleanArea
//
//  Created by 최동호 on 12/5/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack{
            HStack {
                Text("청정구역")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.green)
                    .padding()
                Spacer()
            }
            .frame(width: 300)
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    StartView()
}
