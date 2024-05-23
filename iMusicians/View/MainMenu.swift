//
//  MainMenu.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        VStack{
            TabView{
                HomeView()
                    .tabItem {
                        Image("home")
                        Text("Home")
                    }
                Musicians(search: "")
                    .tabItem {
                        Image("musician")
                        Text("Musicians")
                    }
                MapUIView(coordinate: .init())
                    .tabItem {
                        Image("map")
                        Text("Map")
                    }
                Events(search: "")
                    .tabItem {
                        Image("events")
                        Text("Events")
                    }
                Media(search: "")
                    .tabItem {
                        Image("media")
                        Text("Media")
                    }
            }
        }.navigationTitle("iMusicians")
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MainMenu()
}
