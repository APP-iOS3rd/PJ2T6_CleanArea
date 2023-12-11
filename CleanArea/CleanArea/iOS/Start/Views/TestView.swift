//
//  TestView.swift
//  CleanArea
//
//  Created by 이민호 on 12/8/23.
//

import SwiftUI

struct TestView: View {
    var vm: StartVM?
    @StateObject var network = APIViewModel()
        
    var body: some View {
        VStack {
            if let info = network.result {
                Text("데이터 들어옴")
                List {
                    ForEach(info, id: \.bizId) { policy in
                        Text("정책ID: \(policy.bizId)")
                        Text("정책일련번호: \(policy.polyBizSecd)")
                        Text("기관 및 지자체 구분: \(policy.polyBizTy)")
                        Text("정책명: \(policy.polyBizSjnm)")
                        Text("정책소개: \(policy.polyItcnCn)")
                        Text("지원내용: \(policy.sporCn)")
                        Text("지원규모: \(policy.sporScvl)")
                        Text("사업운영기간내용: \(policy.bizPrdCn)")
                        Text("사업신청기간반복구분코드: \(policy.prdRpttSecd)")
                        Text("사업신청기간내용: \(policy.rqutPrdCn)")
                        Text("연령 정보: \(policy.ageInfo)")
                        Text("전공요건내용: \(policy.majrRqisCn)")
                        Text("취업상태내용: \(policy.empmSttsCn)")
                        Text("특화분야내용: \(policy.splzRlmRqisCn)")
                        Text("학력요건내용: \(policy.accrRqisCn)")
                        Text("거주지및소득조건내용: \(policy.prcpCn)")
                        Text("추가단서사항내용: \(policy.aditRscn)")
                        Text("참여제한대상내용: \(policy.prcpLmttTrgtCn)")
                        Text("신청절차내용: \(policy.rqutProcCn)")
                        Text("제출서류내용: \(policy.pstnPaprCn)")
                        Text("심사발표내용: \(policy.jdgnPresCn)")
                        Text("신청사이트주소: \(policy.rqutUrla)")
                        Text("참고사이트URL주소1: \(policy.rfcSiteUrla1)")
                        Text("참고사이트URL주소2: \(policy.rfcSiteUrla2)")
                        Text("주관부처명: \(policy.mngtMson)")
                        Text("주관부처담당자이름: \(policy.mngtMrofCherCn)")
                        Text("주관부처담당자연락처: \(policy.cherCtpcCn)")
                        Text("운영기관명: \(policy.cnsgNmor)")
                        Text("운영기관담당자이름: \(policy.tintCherCn)")
                        Text("운영기관담당자연락처: \(policy.tintCherCtpcCn)")
                        Text("기타사항: \(policy.etct)")
                        Text("정책분야코드: \(policy.polyRlmCd)")
                        Text("----------------")
                    }
                }
            } else {
                Text("로딩중")
            }
        }
        .onAppear() {
            if let vm = self.vm {
                network.search(vm: vm)
            }
        }
    }
}

//#Preview {
//    TestView()
//}
