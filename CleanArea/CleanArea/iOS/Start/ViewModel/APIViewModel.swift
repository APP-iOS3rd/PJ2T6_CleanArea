//
//  APIModelView.swift
//  CleanArea
//
//  Created by 김지훈 on 2023/12/06.
//

import SwiftUI

class APIViewModel: XMLParser, ObservableObject {
    @Published var result: [YouthPolicy]?
    @Published var policy: Policy? 
    @Published var popularPolicies: [YouthPolicy]?
    
    private var apiKey: String? {
        get {
            let keyfilename = "Info"
            let api_key = "API_KEY"
            
            // 생성한 .plist 파일 경로 불러오기
            guard let filePath = Bundle.main.path(forResource: keyfilename, ofType: "plist") else {
                fatalError("Couldn't find file '\(keyfilename).plist'")
            }
            
            // .plist 파일 내용을 딕셔너리로 받아오기
            let plist = NSDictionary(contentsOfFile: filePath)
            
            // 딕셔너리에서 키 찾기
            guard let value = plist?.object(forKey: api_key) as? String else {
                fatalError("Couldn't find key '\(api_key)'")
            }
            
            return value
        }
    }
    //query: 정책명,정책소개 정보검색, bizTycdSel: 정책분야, srchPolyBizSecd: 주거지 ,keyword: 키워드
    func search(vm: StartVM) {
        guard let apiKey = apiKey else { return }
                
        DispatchQueue.global().async {
            let dispatchGroup = DispatchGroup()
            var result: [YouthPolicy] = []
            let policy = Policy()

            for index in 1...7 {
                dispatchGroup.enter()

                guard let url = URL(string: self.getURL(apiKey, vm.policyName, index)) else {
                    dispatchGroup.leave()
                    return
                }

                self.fetchAndParseXML(from: url) { youthPolicyList in
                    defer {
                        dispatchGroup.leave()
                    }

                    if let youthPolicyList = youthPolicyList {
                        let filtered = self.filter(youthPolicyList.youthPolicies, vm)
                        print(filtered.count)
                        result += youthPolicyList.youthPolicies
                        policy.getPolicy(filtered)
                    }
                }
            }

            dispatchGroup.notify(queue: .main) {
                // 여기서는 모든 백그라운드 작업이 완료된 후에 실행할 코드를 작성합니다.
                self.policy = policy
                self.result = result
            }
        }

    }
}

extension APIViewModel {
    func fetchAndParseXML(from url: URL, completion: @escaping (YouthPolicyList?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let parser = YouthPolicyListParser()
            let youthPolicyList = parser.parse(data: data)
            completion(youthPolicyList)
        }

        task.resume()
    }
    
    func getURL(_ apiKey: String, _ query: String, _ index: Int) -> String {
        let BASE_URL = "https://www.youthcenter.go.kr/opi/youthPlcyList.do"
        
        if query.isEmpty  {
            return "\(BASE_URL)?openApiVlak=\(apiKey)&display=100&pageIndex=\(index)&srchPolyBizSecd=003002008"
        } else {
            return "\(BASE_URL)?openApiVlak=\(apiKey)&display=100&pageIndex=1&query=\(query)"
        }
    }
}
