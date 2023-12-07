//
//  ContentModel.swift
//  XMLPractice
//
//  Created by 노주영 on 2023/12/06.
//

import Foundation

struct YouthPolicyList {
    var pageIndex: Int
    var totalCnt: Int
    var youthPolicies: [YouthPolicy]
}

struct YouthPolicy: Identifiable {
    let id = UUID()
    
    var rnum: Int
    var polyBizTy: String                           //정책 ID
    var polyBizSjnm: String                         //정책명
    var rqutUrla: String                            //신청 사이트 주소
}

//struct YouthPolicyList: Codable {
//    var pageIndex: Int                       //조회 페이지
//    var totalCnt: Int                        //총 건수
//    var youthPolicy: [YouthPolicy]
//}
//
//struct YouthPolicy: Codable {
//    var rnum: Int                               //row 번호
//    var bizId: String                           //정책 ID
//    var polyBizSecd: String                     //정책 일련 번호
//    var polyBizTy: String                       //기관 및 지자체 구분
//    var polyBizSjnm: String                     //정책 명
//    var polyItcnCn: String                      //정책 소개
//    var sporCn: String                          //지원 내용
//    var sporScvl: String                        //지원 규모
//    var bizPrdCn: String                        //사업 운영 기간 내용
//    var prdRpttSecd: String                     //사업 신청 기간 반복 구분 코드
//    var rqutPrdCn: String                       //사업 신청 기간 내용
//    var ageInfo: String                         //연령 정보
//    var majrRqisCn: String                      //전공 요건 내용
//    var empmSttsCn: String                      //취업 상태 내용
//    var splzRlmRqisCn: String                   //특화 분야 내용
//    var accrRqisCn: String                      //학력 요건 내용
//    var prcpCn: String                          //거주지 및 소득 조건 내용
//    var aditRscn: String                        //추가 단서 사항 내용
//    var prcpLmttTrgtCn: String                  //참여 제한 대상 내용
//    var rqutProcCn: String                      //신청 절차 내용
//    var pstnPaprCn: String                      //제출 서류 내용
//    var jdgnPresCn: String                      //심사 발표 내용
//    var rqutUrla: String                        //신청 사이트 주소
//    var rfcSiteUrla1: String                    //참고 사이트 URL 주소 1
//    var rfcSiteUrla2: String                    //참고 사이트 URL 주소 2
//    var mngtMson: String                        //주관 부처명
//    var mngtMrofCherCn: String                  //주관 부처 담당자 이름
//    var cherCtpcCn: String                      //주관 부처 담당자 연락처
//    var cnsgNmor: String                        //운영 기관명
//    var tintCherCn: String                      //운영 기관 담당자 이름
//    var tintCherCtpcCn: String                  //운영 기관 담당자 연락처
//    var etct: String                            //기타사항
//    var polyRlmCd: String                       //정책 분야 코드
//}
