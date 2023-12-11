//
//  Policy.swift
//  CleanArea
//
//  Created by 이민호 on 12/11/23.
//

import Foundation

enum Field: String {
    case job = "023010"
    case residence = "023020"
    case education = "023030"
    case curture = "023040"
    case participation = "023050"
}

class Policy {
    var job: [YouthPolicy] = []
    var residence: [YouthPolicy] = []
    var education: [YouthPolicy] = []
    var curture: [YouthPolicy] = []
    var participation: [YouthPolicy] = []

    func getPolicy(_ policys: [YouthPolicy]) {
        job = filterPolicy(policys, Field.job.rawValue)
        residence = filterPolicy(policys, Field.residence.rawValue)
        education = filterPolicy(policys, Field.education.rawValue)
        curture = filterPolicy(policys, Field.curture.rawValue)
        participation = filterPolicy(policys, Field.participation.rawValue)
    }

    func filterPolicy(_ policys: [YouthPolicy], _ code: String) -> [YouthPolicy] {
        return policys.filter { $0.polyRlmCd == code }
    }
}
