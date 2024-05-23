//
//  WebViewVideo.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 23/5/24.
//

import Foundation
import SwiftUI
import WebKit
struct WebViewVideo:UIViewRepresentable{
     var urlVideo = String()
     func updateUIView(_ uiView: WKWebView, context: Context) {
         uiView.scrollView.isScrollEnabled = false

     }
     func makeUIView(context: Context) ->  WKWebView {
         let webConfiguration = WKWebViewConfiguration()
         webConfiguration.allowsInlineMediaPlayback = true
         webConfiguration.mediaTypesRequiringUserActionForPlayback = []
       
         let webView = WKWebView(frame: .zero,configuration: webConfiguration)
     
         if let urlMain = URL(string:urlVideo) {
             webView.load(URLRequest(url: urlMain))
         }
         return webView
     }
}
