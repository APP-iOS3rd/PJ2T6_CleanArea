//
//  APIFilter.swift
//  CleanArea
//
//  Created by 이민호 on 12/9/23.
//

import SwiftUI

extension APIViewModel {
    func filter(_ policys: [YouthPolicy], _ vm : StartVM) -> [YouthPolicy] {
        let filteredResidence = filterPolicy(policys: policys, srchPolyBizSecd: vm.residence?.getString() ?? "")
        
        return filteredResidence
    }
    
    func filterPolicy (policys: [YouthPolicy], srchPolyBizSecd: String) -> [YouthPolicy] {
        var result: [YouthPolicy] = []
        
        for policy in policys {
            let prcp = policy.prcpCn
            if prcp.contains(srchPolyBizSecd) {
                result.append(policy)
                continue
            }
            
            let regex = ".+(?=시)"
            let isOtherCiry = prcp.range(of: regex, options: .regularExpression) != nil
            if !isOtherCiry {
                result.append(policy)
            }
        }
        return result
    }
    
    
}
