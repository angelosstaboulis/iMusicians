//
//  Company.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import Foundation
struct Company:Identifiable,Hashable{
    var id:Int64
    var name:String
    var type:String
    var fullname:String
    var address:String
    var town:String
    var email:String
    var password:String
    func hash(into hasher: inout Hasher) {
        
    }
}
