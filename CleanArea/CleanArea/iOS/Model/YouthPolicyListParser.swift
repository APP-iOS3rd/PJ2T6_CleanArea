//
//  YouthPolicyListParser.swift
//  CleanArea
//
//  Created by 김지훈 on 2023/12/06.
//

import Foundation


import Foundation

class YouthPolicyListParser: NSObject, XMLParserDelegate {
    
    private var youthPolicyList: YouthPolicyList?
    private var youthPolicies = [YouthPolicy]()
    private var currentElement = ""
    private var currentRnum = ""
    private var currentBizId = ""
    private var currentPolyBizSecd = ""
    private var currentPageIndex = ""
    private var currentTotalCnt = ""
    private var currentPolyBizTy = ""
    private var currentRqutUrla = ""
    private var currentPolyBizSjnm = ""                         // 정책명
    private var currentPolyItcnCn = ""                          // 정책소개
    private var currentSporCn = ""                              // 지원내용
    private var currentSporScvl = ""                            // 지원규모
    private var currentBizPrdCn = ""                            // 사업운영기간내용
    private var currentPrdRpttSecd = ""                         // 사업신청기간반복구분코드
    private var currentRqutPrdCn = ""                           // 사업신청기간내용
    private var currentAgeInfo = ""                             // 연령 정보
    private var currentMajrRqisCn = ""                          // 전공요건내용
    private var currentEmpmSttsCn = ""                          // 취업상태내용
    private var currentSplzRlmRqisCn = ""                       // 특화분야내용
    private var currentAccrRqisCn = ""                          // 학력요건내용
    private var currentPrcpCn = ""                              // 거주지및소득조건내용
    private var currentAditRscn = ""                            // 추가단서사항내용
    private var currentPrcpLmttTrgtCn = ""                      // 참여제한대상내용
    private var currentRqutProcCn = ""                          // 신청절차내용
    private var currentPstnPaprCn = ""                          // 제출서류내용
    private var currentJdgnPresCn = ""                          // 심사발표내용
    private var currentRfcSiteUrla1 = ""                        // 참고사이트URL주소1
    private var currentRfcSiteUrla2 = ""                        // 참고사이트URL주소2
    private var currentMngtMson = ""                            // 주관부처명
    private var currentMngtMrofCherCn = ""                      // 주관부처담당자이름
    private var currentCherCtpcCn = ""                         // 주관부처담당자연락처
    private var currentCnsgNmor = ""                            // 운영기관명
    private var currentTintCherCn = ""                         // 운영기관담당자이름
    private var currentTintCherCtpcCn = ""                     // 운영기관담당자연락처
    private var currentEtct = ""                                // 기타사항
    private var currentPolyRlmCd = ""                           // 정책분야코드
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let change = string.trimmingCharacters(in: .whitespacesAndNewlines)
        switch currentElement {
        case "pageIndex":
            currentPageIndex += change
        case "totalCnt":
            currentTotalCnt += change
        case "rnum":
            currentRnum += change
        case "polyBizTy":
            currentPolyBizTy += change
        case "rqutUrla":
            currentRqutUrla += change
        case "polyBizSjnm":
            currentPolyBizSjnm += change
        case "polyItcnCn":
            currentPolyItcnCn += change
        case "sporCn":
            currentSporCn += change
        case "sporScvl":
            currentSporScvl += change
        case "bizPrdCn":
            currentBizPrdCn += change
        case "prdRpttSecd":
            currentPrdRpttSecd += change
        case "rqutPrdCn":
            currentRqutPrdCn += change
        case "ageInfo":
            currentAgeInfo += change
        case "majrRqisCn":
            currentMajrRqisCn += change
        case "empmSttsCn":
            currentEmpmSttsCn += change
        case "splzRlmRqisCn":
            currentSplzRlmRqisCn += change
        case "accrRqisCn":
            currentAccrRqisCn += change
        case "prcpCn":
            currentPrcpCn += change
        case "aditRscn":
            currentAditRscn += change
        case "prcpLmttTrgtCn":
            currentPrcpLmttTrgtCn += change
        case "rqutProcCn":
            currentRqutProcCn += change
        case "pstnPaprCn":
            currentPstnPaprCn += change
        case "jdgnPresCn":
            currentJdgnPresCn += change
        case "rfcSiteUrla1":
            currentRfcSiteUrla1 += change
        case "rfcSiteUrla2":
            currentRfcSiteUrla2 += change
        case "mngtMson":
            currentMngtMson += change
        case "mngtMrofCherCn":
            currentMngtMrofCherCn += change
        case "cherCtpcCn":
            currentCherCtpcCn += change
        case "cnsgNmor":
            currentCnsgNmor += change
        case "tintCherCn":
            currentTintCherCn += change
        case "tintCherCtpcCn":
            currentTintCherCtpcCn += change
        case "etct":
            currentEtct += change
        case "polyRlmCd":
            currentPolyRlmCd += change
        default:
            break
        }
    }

    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "youthPolicy" {
            if let rnum = Int(currentRnum) {
                let policy = YouthPolicy(
                    rnum: rnum,
                    bizId: currentBizId,
                    polyBizSecd: currentPolyBizSecd,
                    polyBizTy: currentPolyBizTy,
                    polyBizSjnm: currentPolyBizSjnm,
                    polyItcnCn: currentPolyItcnCn,
                    sporCn: currentSporCn,
                    sporScvl: currentSporScvl,
                    bizPrdCn: currentBizPrdCn,
                    prdRpttSecd: currentPrdRpttSecd,
                    rqutPrdCn: currentRqutPrdCn,
                    ageInfo: currentAgeInfo,
                    majrRqisCn: currentMajrRqisCn,
                    empmSttsCn: currentEmpmSttsCn,
                    splzRlmRqisCn: currentSplzRlmRqisCn,
                    accrRqisCn: currentAccrRqisCn,
                    prcpCn: currentPrcpCn,
                    aditRscn: currentAditRscn,
                    prcpLmttTrgtCn: currentPrcpLmttTrgtCn,
                    rqutProcCn: currentRqutProcCn,
                    pstnPaprCn: currentPstnPaprCn,
                    jdgnPresCn: currentJdgnPresCn,
                    rqutUrla: currentRqutUrla,
                    rfcSiteUrla1: currentRfcSiteUrla1,
                    rfcSiteUrla2: currentRfcSiteUrla2,
                    mngtMson: currentMngtMson,
                    mngtMrofCherCn: currentMngtMrofCherCn,
                    cherCtpcCn: currentCherCtpcCn,
                    cnsgNmor: currentCnsgNmor,
                    tintCherCn: currentTintCherCn,
                    tintCherCtpcCn: currentTintCherCtpcCn,
                    etct: currentEtct,
                    polyRlmCd: currentPolyRlmCd
                )
                youthPolicies.append(policy)
            }
            // 초기화
            currentRnum = ""
            currentBizId = ""
            currentPolyBizSecd = ""
            currentPolyBizTy = ""
            currentPolyBizSjnm = ""
            currentPolyItcnCn = ""
            currentSporCn = ""
            currentSporScvl = ""
            currentBizPrdCn = ""
            currentPrdRpttSecd = ""
            currentRqutPrdCn = ""
            currentAgeInfo = ""
            currentMajrRqisCn = ""
            currentEmpmSttsCn = ""
            currentSplzRlmRqisCn = ""
            currentAccrRqisCn = ""
            currentPrcpCn = ""
            currentAditRscn = ""
            currentPrcpLmttTrgtCn = ""
            currentRqutProcCn = ""
            currentPstnPaprCn = ""
            currentJdgnPresCn = ""
            currentRqutUrla = ""
            currentRfcSiteUrla1 = ""
            currentRfcSiteUrla2 = ""
            currentMngtMson = ""
            currentMngtMrofCherCn = ""
            currentCherCtpcCn = ""
            currentCnsgNmor = ""
            currentTintCherCn = ""
            currentTintCherCtpcCn = ""
            currentEtct = ""
            currentPolyRlmCd = ""
        } else if elementName == "youthPolicyList" {
            if let pageIndex = Int(currentPageIndex.trimmingCharacters(in: .whitespacesAndNewlines)),
               let totalCnt = Int(currentTotalCnt.trimmingCharacters(in: .whitespacesAndNewlines)) {
                youthPolicyList = YouthPolicyList(pageIndex: pageIndex, totalCnt: totalCnt, youthPolicies: youthPolicies)
            }
        }
    }

    func parse(data: Data) -> YouthPolicyList? {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        return youthPolicyList
    }
}
