//
//  DatabaseManager.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import Foundation
import SQLite
class DatabaseInit{
    func createConnection() -> Connection{
        let path = Bundle.main.resourcePath!
        
        let sourcePath = "\(path)/iMusiciansDB.db"
        
        _ = copyDatabaseIfNeeded(sourcePath: sourcePath)
        
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destinationPath = documents + "/iMusicians.db"

        return try! Connection(destinationPath)
    }
    func copyDatabaseIfNeeded(sourcePath: String) -> Bool {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destinationPath = documents + "/iMusicians.db"
        let exists = FileManager.default.fileExists(atPath: destinationPath)
        guard !exists else { return false }
        do {
            try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
            return true
        } catch {
            print("error during file copy: \(error)")
            return false
        }
    }
}
class DataFetcher{
    func fetchUsers(connection:DatabaseInit) -> [Users] {
        var users:[Users] = []
        do{
            for record in try connection.createConnection().prepare("SELECT * FROM users"){
                guard let userID = record[0] else {
                    return []
                }
                guard let lastname = record[1] else {
                    return []
                }
                guard let firstname = record[2] else {
                    return []
                }
                guard let email = record[3] else {
                    return []
                }
                guard let town = record[4] else {
                    return []
                }
                guard let media = record[5]  else {
                    return []
                }
                guard let eventdate = record[6]  else {
                    return []
                }
                users.append(Users(id: userID as! Int64, lastname:String(describing:lastname), firstname: String(describing:firstname), email: String(describing:email), town: String(describing:town), media: String(describing:media), eventdate: String(describing:eventdate)))
            }
        }catch{
            debugPrint("something went wrong!!!!"+error.localizedDescription)
        }
        
        return users
    }
    
    func fetchCompany(connection:DatabaseInit) -> [Company] {
        var company:[Company] = []
        do{
            for record in try connection.createConnection().prepare("SELECT * FROM company"){
                guard let userID = record[0] else {
                    return []
                }
                guard let name = record[1] else {
                    return []
                }
                guard let type = record[2] else {
                    return []
                }
                guard let fullname = record[3] else {
                    return []
                }
                guard let address = record[4] else {
                    return []
                }
                guard let town = record[5]  else {
                    return []
                }
                guard let email = record[6]  else {
                    return []
                }
                guard let password = record[7]  else {
                    return []
                }
                company.append(Company(id: userID as! Int64, name: String(describing:name), type: String(describing:type), fullname: String(describing:fullname), address:String(describing:address), town: String(describing:town), email:String(describing:email), password: String(describing:password)))
            }
        }catch{
            debugPrint("something went wrong!!!!"+error.localizedDescription)
        }
        
        return company
    }
    
    
    
    
    
}
class DataManager{
    func createUser(connection:DatabaseInit,model:Users){
        do{
            let table = Table("Users")
            let id = Expression<Int64>("id")
            let lastname = Expression<String>("lastname")
            let firstname = Expression<String>("firstname")
            let email = Expression<String>("email")
            let town = Expression<String>("town")
            let media = Expression<String>("media")
            let eventdate = Expression<String>("eventdate")
            let users = table.insert([id<-Int64.random(in: 1...100000),lastname<-model.lastname,firstname<-model.firstname,email<-model.email,town<-model.town,media<-model.media,eventdate<-model.eventdate])
            try connection.createConnection().run(users)
        }catch{
            debugPrint("something went wrong!!!!")
        }
    }
    func createCompany(connection:DatabaseInit,model:Company){
        do{
            let table = Table("Company")
            let id = Expression<Int64>("id")
            let name = Expression<String>("name")
            let type = Expression<String>("type")
            let fullname = Expression<String>("fullname")
            let address = Expression<String>("address")
            let town = Expression<String>("town")
            let email = Expression<String>("email")
            let password = Expression<String>("password")
            let company = table.insert([id<-Int64.random(in: 1...100000),name<-model.name,type<-model.type,fullname<-model.fullname,address<-model.address,town<-model.town,email<-model.email,password<-model.password])
            try connection.createConnection().run(company)
        }catch{
            debugPrint("something went wrong!!!!")
        }
    }
}
class DatabaseManager{
    let connectionDB = DatabaseInit()
    let fetcher = DataFetcher()
    let manager = DataManager()
    static let shared = DatabaseManager()
    private init(){}
    func createUser(model:Users){
        manager.createUser(connection: connectionDB, model: model)
    }
    func createCompany(model:Company){
        manager.createCompany(connection: connectionDB, model: model)
    }
    func fetchUsers()->[Users]{
        return fetcher.fetchUsers(connection: connectionDB)
    }
    
    func fetchCompany()->[Company]{
        return fetcher.fetchCompany(connection: connectionDB)
    }
    
}
