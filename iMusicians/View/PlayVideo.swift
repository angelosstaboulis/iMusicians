//
//  PlayVideo.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 23/5/24.
//

import SwiftUI

struct PlayVideo: View {
    @State private var amount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var url:String
    var body: some View {
               ZStack(alignment: .center) {
                   ProgressView("Loading…", value: amount, total: 26)
                       .onReceive(timer) { _ in
                           if amount < 26 {
                               amount += 2
                           }
                   }.opacity(amount < 26 ? 1 : 0.0)
                   .progressViewStyle(.circular)
                   
               }.background {
                   WebViewVideo(urlVideo: url).frame(width:UIScreen.main.bounds.width - 5,height:UIScreen.main.bounds.height - 220)
               }
            
       }
}

#Preview {
    PlayVideo(url: "")
}
