//
//  ContentModel.swift
//  XMLPractice
//
//  Created by 노주영 on 2023/12/06.
//

import Foundation
import SwiftData

@Model
class YouthPolicy: Codable, Hashable {
    enum CodingKeys: CodingKey {
        case bizId, polyBizSecd, polyBizTy, polyBizSjnm, polyItcnCn, sporCn, sporScvl, bizPrdCn, prdRpttSecd, rqutPrdCn, ageInfo, majrRqisCn, empmSttsCn, splzRlmRqisCn, accrRqisCn, prcpCn, aditRscn, prcpLmttTrgtCn, rqutProcCn, pstnPaprCn, jdgnPresCn, rqutUrla, rfcSiteUrla1, rfcSiteUrla2, mngtMson, mngtMrofCherCn, cherCtpcCn, cnsgNmor, tintCherCn, tintCherCtpcCn, etct, polyRlmCd, minAge, maxAge, startDate, endDate, views
    }
        
    var bizId: String           // 정책 ID
    var polyBizSecd: String     // 정책일련번호
    var polyBizTy: String       // 기관 및 지자체 구분
    var polyBizSjnm: String     // 정책명
    var polyItcnCn: String      // 정책소개
    var sporCn: String          // 지원내용
    var sporScvl: String        // 지원규모
    var bizPrdCn: String        // 사업운영기간내용
    var prdRpttSecd: String     // 사업신청기간반복구분코드
    var rqutPrdCn: String       // 사업신청기간내용
    var ageInfo: String         // 연령 정보
    var majrRqisCn: String      // 전공요건내용
    var empmSttsCn: String      // 취업상태내용
    var splzRlmRqisCn: String   // 특화분야내용
    var accrRqisCn: String      // 학력요건내용
    var prcpCn: String          // 거주지및소득조건내용
    var aditRscn: String        // 추가단서사항내용
    var prcpLmttTrgtCn: String  // 참여제한대상내용
    var rqutProcCn: String      // 신청절차내용
    var pstnPaprCn: String      // 제출서류내용
    var jdgnPresCn: String      // 심사발표내용
    var rqutUrla: String        // 신청사이트주소
    var rfcSiteUrla1: String    // 참고사이트URL주소1
    var rfcSiteUrla2: String    // 참고사이트URL주소2
    var mngtMson: String        // 주관부처명
    var mngtMrofCherCn: String  // 주관부처담당자이름
    var cherCtpcCn: String      // 주관부처담당자연락처
    var cnsgNmor: String        // 운영기관명
    var tintCherCn: String      // 운영기관담당자이름
    var tintCherCtpcCn: String  // 운영기관담당자연락처
    var etct: String            // 기타사항
    var polyRlmCd: String       // 정책분야코드
    var minAge: String          // 최소나이
    var maxAge: String       // 최대나이
    var startDate: String       // 정책시작일
    var endDate: String       // 정책종료일
    var views: Int              //조회수
    
    init(bizId: String, polyBizSecd: String, polyBizTy: String, polyBizSjnm: String, polyItcnCn: String, sporCn: String, sporScvl: String, bizPrdCn: String, prdRpttSecd: String, rqutPrdCn: String, ageInfo: String, majrRqisCn: String, empmSttsCn: String, splzRlmRqisCn: String, accrRqisCn: String, prcpCn: String, aditRscn: String, prcpLmttTrgtCn: String, rqutProcCn: String, pstnPaprCn: String, jdgnPresCn: String, rqutUrla: String, rfcSiteUrla1: String, rfcSiteUrla2: String, mngtMson: String, mngtMrofCherCn: String, cherCtpcCn: String, cnsgNmor: String, tintCherCn: String, tintCherCtpcCn: String, etct: String, polyRlmCd: String, minAge: String, maxAge: String, startDate: String, endDate: String, views: Int) {
                
        self.bizId = bizId
        self.polyBizSecd = polyBizSecd
        self.polyBizTy = polyBizTy
        self.polyBizSjnm = polyBizSjnm
        self.polyItcnCn = polyItcnCn
        self.sporCn = sporCn
        self.sporScvl = sporScvl
        self.bizPrdCn = bizPrdCn
        self.prdRpttSecd = prdRpttSecd
        self.rqutPrdCn = rqutPrdCn
        self.ageInfo = ageInfo
        self.majrRqisCn = majrRqisCn
        self.empmSttsCn = empmSttsCn
        self.splzRlmRqisCn = splzRlmRqisCn
        self.accrRqisCn = accrRqisCn
        self.prcpCn = prcpCn
        self.aditRscn = aditRscn
        self.prcpLmttTrgtCn = prcpLmttTrgtCn
        self.rqutProcCn = rqutProcCn
        self.pstnPaprCn = pstnPaprCn
        self.jdgnPresCn = jdgnPresCn
        self.rqutUrla = rqutUrla
        self.rfcSiteUrla1 = rfcSiteUrla1
        self.rfcSiteUrla2 = rfcSiteUrla2
        self.mngtMson = mngtMson
        self.mngtMrofCherCn = mngtMrofCherCn
        self.cherCtpcCn = cherCtpcCn
        self.cnsgNmor = cnsgNmor
        self.tintCherCn = tintCherCn
        self.tintCherCtpcCn = tintCherCtpcCn
        self.etct = etct
        self.polyRlmCd = polyRlmCd
        self.minAge = minAge
        self.maxAge = maxAge
        self.startDate = startDate
        self.endDate = endDate
        self.views = views
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bizId = try container.decode(String.self, forKey: .bizId)
        self.polyBizSecd = try container.decode(String.self, forKey: .polyBizSecd)
        self.polyBizTy = try container.decode(String.self, forKey: .polyBizTy)
        self.polyBizSjnm = try container.decode(String.self, forKey: .polyBizSjnm)
        self.polyItcnCn = try container.decode(String.self, forKey: .polyItcnCn)
        self.sporCn = try container.decode(String.self, forKey: .sporCn)
        self.sporScvl = try container.decode(String.self, forKey: .sporScvl)
        self.bizPrdCn = try container.decode(String.self, forKey: .bizPrdCn)
        self.prdRpttSecd = try container.decode(String.self, forKey: .prdRpttSecd)
        self.rqutPrdCn = try container.decode(String.self, forKey: .rqutPrdCn)
        self.ageInfo = try container.decode(String.self, forKey: .ageInfo)
        self.majrRqisCn = try container.decode(String.self, forKey: .majrRqisCn)
        self.empmSttsCn = try container.decode(String.self, forKey: .empmSttsCn)
        self.splzRlmRqisCn = try container.decode(String.self, forKey: .splzRlmRqisCn)
        self.accrRqisCn = try container.decode(String.self, forKey: .accrRqisCn)
        self.prcpCn = try container.decode(String.self, forKey: .prcpCn)
        self.aditRscn = try container.decode(String.self, forKey: .aditRscn)
        self.prcpLmttTrgtCn = try container.decode(String.self, forKey: .prcpLmttTrgtCn)
        self.rqutProcCn = try container.decode(String.self, forKey: .rqutProcCn)
        self.pstnPaprCn = try container.decode(String.self, forKey: .pstnPaprCn)
        self.jdgnPresCn = try container.decode(String.self, forKey: .jdgnPresCn)
        self.rqutUrla = try container.decode(String.self, forKey: .rqutUrla)
        self.rfcSiteUrla1 = try container.decode(String.self, forKey: .rfcSiteUrla1)
        self.rfcSiteUrla2 = try container.decode(String.self, forKey: .rfcSiteUrla2)
        self.mngtMson = try container.decode(String.self, forKey: .mngtMson)
        self.mngtMrofCherCn = try container.decode(String.self, forKey: .mngtMrofCherCn)
        self.cherCtpcCn = try container.decode(String.self, forKey: .cherCtpcCn)
        self.cnsgNmor = try container.decode(String.self, forKey: .cnsgNmor)
        self.tintCherCn = try container.decode(String.self, forKey: .tintCherCn)
        self.tintCherCtpcCn = try container.decode(String.self, forKey: .tintCherCtpcCn)
        self.etct = try container.decode(String.self, forKey: .etct)
        self.polyRlmCd = try container.decode(String.self, forKey: .polyRlmCd)
        self.minAge = try container.decode(String.self, forKey: .minAge)
        self.maxAge = try container.decode(String.self, forKey: .maxAge)
        self.startDate = try container.decode(String.self, forKey: .startDate)
        self.endDate = try container.decode(String.self, forKey: .endDate)
        self.views = try container.decode(Int.self, forKey: .views)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bizId, forKey: .bizId)
        try container.encode(polyBizSecd, forKey: .polyBizSecd)
        try container.encode(polyBizTy, forKey: .polyBizTy)
        try container.encode(polyBizSjnm, forKey: .polyBizSjnm)
        try container.encode(polyItcnCn, forKey: .polyItcnCn)
        try container.encode(sporCn, forKey: .sporCn)
        try container.encode(sporScvl, forKey: .sporScvl)
        try container.encode(bizPrdCn, forKey: .bizPrdCn)
        try container.encode(prdRpttSecd, forKey: .prdRpttSecd)
        try container.encode(rqutPrdCn, forKey: .rqutPrdCn)
        try container.encode(ageInfo, forKey: .ageInfo)
        try container.encode(majrRqisCn, forKey: .majrRqisCn)
        try container.encode(empmSttsCn, forKey: .empmSttsCn)
        try container.encode(splzRlmRqisCn, forKey: .splzRlmRqisCn)
        try container.encode(accrRqisCn, forKey: .accrRqisCn)
        try container.encode(prcpCn, forKey: .prcpCn)
        try container.encode(aditRscn, forKey: .aditRscn)
        try container.encode(prcpLmttTrgtCn, forKey: .prcpLmttTrgtCn)
        try container.encode(rqutProcCn, forKey: .rqutProcCn)
        try container.encode(pstnPaprCn, forKey: .pstnPaprCn)
        try container.encode(jdgnPresCn, forKey: .jdgnPresCn)
        try container.encode(rqutUrla, forKey: .rqutUrla)
        try container.encode(rfcSiteUrla1, forKey: .rfcSiteUrla1)
        try container.encode(rfcSiteUrla2, forKey: .rfcSiteUrla2)
        try container.encode(mngtMson, forKey: .mngtMson)
        try container.encode(mngtMrofCherCn, forKey: .mngtMrofCherCn)
        try container.encode(cherCtpcCn, forKey: .cherCtpcCn)
        try container.encode(cnsgNmor, forKey: .cnsgNmor)
        try container.encode(tintCherCn, forKey: .tintCherCn)
        try container.encode(tintCherCtpcCn, forKey: .tintCherCtpcCn)
        try container.encode(etct, forKey: .etct)
        try container.encode(polyRlmCd, forKey: .polyRlmCd)
        try container.encode(minAge, forKey: .minAge)
        try container.encode(maxAge, forKey: .maxAge)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(endDate, forKey: .endDate)
        try container.encode(views, forKey: .views)
    }
}
