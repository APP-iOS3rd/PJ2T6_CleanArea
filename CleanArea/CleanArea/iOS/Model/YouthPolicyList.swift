//
//  ContentModel.swift
//  XMLPractice
//
//  Created by 노주영 on 2023/12/06.
//

import Foundation
import SwiftData

//받아올 데이터
struct YouthPolicyList {
    var pageIndex: Int
    var totalCnt: Int
    var youthPolicies: [YouthPolicy]
}

@Model
class YouthPolicy: Identifiable {
    @Attribute(.unique) let id = UUID()

    var rnum: Int               //row 번호
    var bizId: String           //정책 ID
    var polyBizSecd: String     // 정책일련번호
    var polyBizTy: String       //기관 및 지자체 구분
    var polyBizSjnm: String     // 정책명
    var polyItcnCn: String      //정책소개
    var sporCn: String          //지원내용
    var sporScvl: String        //지원규모
    var bizPrdCn: String        //사업운영기간내용
    var prdRpttSecd: String     //사업신청기간반복구분코드
    var rqutPrdCn: String       //사업신청기간내용
    var ageInfo: String         //연령 정보
    var majrRqisCn: String      //전공요건내용
    var empmSttsCn: String      //취업상태내용
    var splzRlmRqisCn: String   //특화분야내용
    var accrRqisCn: String      //학력요건내용
    var prcpCn: String          //거주지및소득조건내용
    var aditRscn: String        // , 추가단서사항내용
    var prcpLmttTrgtCn: String  //, 참여제한대상내용
    var rqutProcCn: String      // 신청절차내용
    var pstnPaprCn: String      //  제출서류내용
    var jdgnPresCn: String      //  심사발표내용
    var rqutUrla: String        //  신청사이트주소
    var rfcSiteUrla1: String    // 참고사이트URL주소1
    var rfcSiteUrla2: String    // 참고사이트URL주소2
    var mngtMson: String        //주관부처명
    var mngtMrofCherCn: String // , 주관부처담당자이름
    var cherCtpcCn: String      // , 주관부처담당자연락처
    var cnsgNmor: String        // , 운영기관명
    var tintCherCn: String      // 운영기관담당자이름
    var tintCherCtpcCn: String  //  운영기관담당자연락처
    var etct: String            // 기타사항
    var polyRlmCd: String       // 정책분야코드
    
    init(rnum: Int, bizId: String, polyBizSecd: String, polyBizTy: String, polyBizSjnm: String, polyItcnCn: String, sporCn: String, sporScvl: String, bizPrdCn: String, prdRpttSecd: String, rqutPrdCn: String, ageInfo: String, majrRqisCn: String, empmSttsCn: String, splzRlmRqisCn: String, accrRqisCn: String, prcpCn: String, aditRscn: String, prcpLmttTrgtCn: String, rqutProcCn: String, pstnPaprCn: String, jdgnPresCn: String, rqutUrla: String, rfcSiteUrla1: String, rfcSiteUrla2: String, mngtMson: String, mngtMrofCherCn: String, cherCtpcCn: String, cnsgNmor: String, tintCherCn: String, tintCherCtpcCn: String, etct: String, polyRlmCd: String) {
        self.rnum = rnum
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
    }
}
