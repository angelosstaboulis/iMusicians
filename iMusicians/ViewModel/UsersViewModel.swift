//
//  UsersViewModel.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import Foundation
import SQLite
class UsersViewModel:ObservableObject{
    func createUser(model:Users){
        DatabaseManager.shared.createUser(model: model)
    }
    func fetchUsers()->[Users]{
        DatabaseManager.shared.fetchUsers()
    }
   
}
