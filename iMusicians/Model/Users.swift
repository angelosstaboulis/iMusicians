//
//  Users.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import Foundation
struct Users:Identifiable,Hashable{
    var id:Int64
    var lastname:String
    var firstname:String
    var email:String
    var town:String
    var media:String
    var eventdate:String
    func hash(into hasher: inout Hasher) {
        
    }
}
