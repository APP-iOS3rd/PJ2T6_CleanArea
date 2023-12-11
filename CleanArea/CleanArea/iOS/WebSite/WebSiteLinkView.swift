//
//  WebSiteLinkView.swift
//  CleanArea
//
//  Created by 노주영 on 12/11/23.
//

import SwiftUI
import WebKit

struct WebSiteLinkView: UIViewRepresentable {
    @Binding var isLoading: Bool
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    // 업데이트 UIView
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

extension WebSiteLinkView {
    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var control: WebSiteLinkView
        
        init(control: WebSiteLinkView) {
            self.control = control
        }
        
        // 기본 프레임에서 탐색이 시작되었음
        func webView(_ webView: WKWebView,
                     didStartProvisionalNavigation navigation: WKNavigation!) {
            print("시작")
            control.isLoading = true
        }
        
        // 웹보기가 기본 프레임에 대한 내용을 수신하기 시작했음
        func webView(_ webView: WKWebView,
                     didCommit navigation: WKNavigation!) {
            print("수신중");
        }
        
        // 탐색이 완료 되었음
        func webView(_ webview: WKWebView,
                     didFinish: WKNavigation!) {
            print("완료")
            control.isLoading = false
        }
        
        // 초기 탐색 프로세스 중에 오류가 발생했음 - Error Handler
        func webView(_ webView: WKWebView,
                     didFailProvisionalNavigation: WKNavigation!,
                     withError: Error) {
            print("초기 오류")
        }
        
        // 탐색 중에 오류가 발생했음 - Error Handler
        func webView(_ webView: WKWebView,
                     didFail navigation: WKNavigation!,
                     withError error: Error) {
            print("수신중 오류")
        }
    }
}
