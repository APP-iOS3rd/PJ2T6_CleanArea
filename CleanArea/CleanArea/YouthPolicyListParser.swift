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
    private var currentPageIndex = ""
    private var currentTotalCnt = ""
    private var currentPolyBizTy = ""
    private var currentRqutUrla = ""
    private var currendPolyBizSjnm = ""                         //정책명

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
            currendPolyBizSjnm += change
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser,didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "youthPolicy" {
            if let rnum = Int(currentRnum) {
                let policy = YouthPolicy(rnum: rnum, polyBizTy: currentPolyBizTy, polyBizSjnm: currendPolyBizSjnm, rqutUrla: currentRqutUrla)
                youthPolicies.append(policy)
            }
            currentRnum = ""
            currentPolyBizTy = ""
            currendPolyBizSjnm = ""
            currentRqutUrla = ""
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
