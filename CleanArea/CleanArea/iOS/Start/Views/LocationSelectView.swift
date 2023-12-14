//
//  LocationSelectView.swift
//  CleanArea
//
//  Created by 노주영 on 12/14/23.
//

import SwiftUI

struct LocationSelectView: View {
    @EnvironmentObject var vm: StartVM
    
    @State var selectIndex: Int = 0
    
    let randomPos: [CGFloat] = [-5, 24, -2, -7, 28, 27]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<vm.citys.count) { index in
                    if index%3 == 2 {
                        HStack {
                            StartCellView(selectIndex: $selectIndex, index: index-2)
                                .environmentObject(vm)
                            StartCellView(selectIndex: $selectIndex, index: index-1)
                                .environmentObject(vm)
                            StartCellView(selectIndex: $selectIndex, index: index)
                                .environmentObject(vm)
                        }
                    } else if index == vm.citys.count-1 {
                        HStack {
                            StartCellView(selectIndex: $selectIndex, index: index-1)
                                .environmentObject(vm)
                            StartCellView(selectIndex: $selectIndex, index: index)
                                .environmentObject(vm)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding(.horizontal, 10)
        }
        
    }
}

#Preview {
    LocationSelectView()
}
