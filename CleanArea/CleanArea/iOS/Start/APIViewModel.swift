//
//  APIModelView.swift
//  CleanArea
//
//  Created by 김지훈 on 2023/12/06.
//

import Foundation

class APIViewModel: XMLParser, ObservableObject {
    
    @Published var result: YouthPolicyList?    
    
    var apiKey: String? {
        get {
            let keyfilename = "ApiKeys"
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
    //query: 정책명,정책소개 정보검색 , bizTycdSel: 정책분야,srchPolyBizSecd: 주거지(경기) ,keyword: 키워드
    func search(query: String, srchPolyBizSecd:String) {
        
        guard let apiKey = apiKey else { return }
        
        guard let url = URL(string: "https://www.youthcenter.go.kr/opi/youthPlcyList.do?pageIndex=1&display=10&query=%EC%A3%BC%EA%B1%B0&bizTycdSel=&openApiVlak=\(apiKey)&srchPolyBizSecd=003002008&keyword=") else { return }
        
        fetchAndParseXML(from: url) { youthPolicyList in
            if let youthPolicyList = youthPolicyList {
                DispatchQueue.main.async {
                    print(youthPolicyList)
                    self.result = youthPolicyList
                }
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
}
