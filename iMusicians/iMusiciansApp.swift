//
//  iMusiciansApp.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import SwiftUI

@main
struct iMusiciansApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(company: .init(id: 0, name: "", type: "", fullname: "", address:"", town: "", email: "", password: ""), companyViewModel: .init())
        }
    }
}
