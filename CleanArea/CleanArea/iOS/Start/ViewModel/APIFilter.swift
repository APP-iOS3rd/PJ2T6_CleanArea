//
//  APIFilter.swift
//  CleanArea
//
//  Created by 이민호 on 12/9/23.
//

import SwiftUI

extension APIViewModel {
    func filter(_ policys: [YouthPolicy], _ vm : StartVM) -> [YouthPolicy] {
        let filteredResidence = filterResidence(policys: policys, vm: vm)
        let filterJobStatus = filterJobStatus(policys: filteredResidence, empmSttsCn: vm.employmentStatus)
        let filterEducation = filterEducation(policys: filterJobStatus, accrRqisCn: vm.educationLevel)
        let filterAge = filterAge(policys: filterEducation, ageInfo: vm.age)
        
        return filterAge
    }
    
    func filterResidence (policys: [YouthPolicy], vm: StartVM) -> [YouthPolicy] {
        guard let residence = vm.residence else {
            return policys
        }
        
        let excepts = City.allCases.filter { $0 != residence }
        
        return policys.filter { policy in
            (policy.prcpCn.contains(residence.rawValue) ||
             policy.prcpCn.contains("제한없음") ||
             policy.prcpCn.contains("경기도")) &&
            !excepts.contains { policy.prcpCn.contains($0.getString()) }
        }
    }
        
    func filterJobStatus (policys: [YouthPolicy], empmSttsCn: String) -> [YouthPolicy] {
        if empmSttsCn == "제한없음" || empmSttsCn == "" {
            return policys
        }
        
        return policys.filter {$0.empmSttsCn == "제한없음" || $0.empmSttsCn == "-" || $0.empmSttsCn == empmSttsCn}
    }
    
    func filterEducation (policys: [YouthPolicy], accrRqisCn: String) -> [YouthPolicy] {
        if accrRqisCn == "제한없음" || accrRqisCn == "" {
            return policys
        }
        
        return policys.filter {$0.empmSttsCn == "제한없음" || $0.empmSttsCn == "-" || $0.accrRqisCn == accrRqisCn}
    }
    
    func filterAge(policys: [YouthPolicy], ageInfo: String) -> [YouthPolicy] {
        return policys.filter { isPossibleAge(targetAge: $0.ageInfo, ageInfo: ageInfo)}
    }
    
    func isPossibleAge(targetAge: String, ageInfo: String) -> Bool {
        if ageInfo == "" || targetAge == "제한없음" || targetAge == "-" {
            return true
        }
                        
        let replaced = targetAge.replacingOccurrences(of: "[가-힣]", with: "", options: .regularExpression)
        let withoutSpacing = replaced.replacingOccurrences(of: " ", with: "")
        let result = withoutSpacing.components(separatedBy: "~")
        
        // 예: 만 20세 이상 or 만 29세 이하
        if result.count == 1, let ele = Int(result[0]), let target = Int(targetAge) {
            if targetAge.contains("이상") {
                return ele <= target
            } else {
                return ele >= target
            }
        }
        
        // 예: 만 20 ~ 29
        if result.count == 2, let min = Int(result[0]), let max = Int(result[1]), let target = Int(targetAge) {
            return min <= target && max >= target
        }
        
        return true
    }
}

