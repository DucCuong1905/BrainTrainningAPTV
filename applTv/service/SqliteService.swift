//
//  SqliteService.swift
//  applTv
//
//  Created by NguyenhuySOn on 11/5/20.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit
import SQLite


protocol UserId {
    var id: Int { get set }
}

class SqliteService: NSObject {
    var database: Connection!
    static var share = SqliteService()
    let usersTable = Table("users")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let pass = Expression<String>("pass")
    let picture = Expression<String>("picture")
    let score = Expression<Int>("score")
    
    
    
    func checkConnecDB(){
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
    }
    func createTable() {
        print("CREATE TAPPED")
        
        let createTable = self.usersTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.pass)
            table.column(self.picture)
            table.column(self.score)
        }
        
        do {
            try self.database.run(createTable)
            print("Created Table sussecc")
        } catch {
            print(error)
        }
    }
    func insertUser(name: String?, pass: String?) {
        print("INSERT TAPPED")
        
        guard let name = name,
              let pass = pass
        else { return }
        print(name)
        print(pass)
        
        let insertUser = self.usersTable.insert(self.name <- name, self.pass <- pass, self.picture <- "", self.score <- 0 )
        
        do {
            try self.database.run(insertUser)
            print("INSERTED USER SUSSECC")
        } catch {
            print(error)
        }
        
    }
    func showListUsers(){
        print("LIST TAPPED")
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users {
                print("userId: \(user[self.id]), name: \(user[self.name]), pass: \(user[self.pass]), picture: \(user[self.picture]), score: \(user[self.score])")
            }
        } catch {
            print(error)
        }
    }
    func getAllData() -> [AccountModel] {
        print("get all database")
        var listData = [AccountModel]()
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users {
                let userAdd = AccountModel(id: user[self.id], name: user[self.name], pass: user[self.pass], picture: user[self.picture], score: user[self.score])
                listData.append(userAdd)
            }
        } catch {
            print(error)
        }
        return listData
    }
    
    func findUserData(id: Int?) -> AccountModel {
        let listDb = self.getAllData()
        let user = listDb[0]
        for item in listDb {
            if item.id == id {
                user.id = item.id
                user.name = item.name
                user.picture = item.picture
                user.password = item.password
                user.score = item.score
            }
        }
        return user
    }
    
    
    func checkLogin(name: String?, pass: String?) -> Bool {
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users {
                if name == user[self.name] && pass == user[self.pass]  {
                    print("userId: \(user[self.id]), name: \(user[self.name]), email: \(user[self.pass]), picture: \(user[self.picture]), score: \(user[self.score])")
                    return true
                }
            }
        } catch {
            print(error)
            return false
        }
        
        return true
    }
    
    func updateUserAvatar(id: Int?, picture: String?) {
        print("UPDATE TAPPED")
        
        guard  let userId = id,
               let picture = picture
        else { return }
        print(String(id ?? 0))
        print(name)
        print(pass)
        print(picture)
        
        let user = self.usersTable.filter(self.id == userId)
        let updateUser = user.update(self.picture <- picture)
        do {
            try self.database.run(updateUser)
        } catch {
            print(error)
        }
    }
    
    func updateUserScore(id: Int?, score: Int?) {
        print("UPDATE TAPPED")
        
        guard  let userId = id,
               let score = score
        else { return }
        
        let user = self.usersTable.filter(self.id == userId)
        let updateUser = user.update(self.score <- score)
        do {
            try self.database.run(updateUser)
            print("update sussecc")
        } catch {
            print(error)
        }
    }
    
    func deleteUser(userId: Int?) {
        print("DELETE TAPPED")
        guard let userId = userId
        else { return }
        print(String(userId))
        let user = self.usersTable.filter(self.id == userId)
        let deleteUser = user.delete()
        do {
            try self.database.run(deleteUser)
            print("DELETE TAPPED SUSSECC")
        } catch {
            print(error)
        }
    }
}



















/*
 //
 //  ViewController.swift
 //  Sequel Lite
 //
 //  Created by Kyle Lee on 7/16/17.
 //  Copyright © 2017 Kyle Lee. All rights reserved.
 //
 
 import UIKit
 import SQLite
 
 class ViewController: UIViewController {
 
 var database: Connection!
 
 let usersTable = Table("users")
 let id = Expression<Int>("id")
 let name = Expression<String>("name")
 let email = Expression<String>("email")
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 do {
 let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
 let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
 let database = try Connection(fileUrl.path)
 self.database = database
 } catch {
 print(error)
 }
 }
 
 @IBAction func createTable() {
 print("CREATE TAPPED")
 
 let createTable = self.usersTable.create { (table) in
 table.column(self.id, primaryKey: true)
 table.column(self.name)
 table.column(self.email, unique: true)
 }
 
 do {
 try self.database.run(createTable)
 print("Created Table")
 } catch {
 print(error)
 }
 }
 
 @IBAction func insertUser() {
 print("INSERT TAPPED")
 let alert = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
 alert.addTextField { (tf) in tf.placeholder = "Name" }
 alert.addTextField { (tf) in tf.placeholder = "Email" }
 let action = UIAlertAction(title: "Submit", style: .default) { (_) in
 guard let name = alert.textFields?.first?.text,
 let email = alert.textFields?.last?.text
 else { return }
 print(name)
 print(email)
 
 let insertUser = self.usersTable.insert(self.name <- name, self.email <- email)
 
 do {
 try self.database.run(insertUser)
 print("INSERTED USER")
 } catch {
 print(error)
 }
 
 }
 alert.addAction(action)
 present(alert, animated: true, completion: nil)
 
 }
 
 @IBAction func listUsers() {
 print("LIST TAPPED")
 
 do {
 let users = try self.database.prepare(self.usersTable)
 for user in users {
 print("userId: \(user[self.id]), name: \(user[self.name]), email: \(user[self.email])")
 }
 } catch {
 print(error)
 }
 }
 
 @IBAction func updateUser() {
 print("UPDATE TAPPED")
 let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
 alert.addTextField { (tf) in tf.placeholder = "User ID" }
 alert.addTextField { (tf) in tf.placeholder = "Email" }
 let action = UIAlertAction(title: "Submit", style: .default) { (_) in
 guard let userIdString = alert.textFields?.first?.text,
 let userId = Int(userIdString),
 let email = alert.textFields?.last?.text
 else { return }
 print(userIdString)
 print(email)
 
 let user = self.usersTable.filter(self.id == userId)
 let updateUser = user.update(self.email <- email)
 do {
 try self.database.run(updateUser)
 } catch {
 print(error)
 }
 }
 alert.addAction(action)
 present(alert, animated: true, completion: nil)
 }
 
 @IBAction func deleteUser() {
 print("DELETE TAPPED")
 let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
 alert.addTextField { (tf) in tf.placeholder = "User ID" }
 let action = UIAlertAction(title: "Submit", style: .default) { (_) in
 guard let userIdString = alert.textFields?.first?.text,
 let userId = Int(userIdString)
 else { return }
 print(userIdString)
 
 let user = self.usersTable.filter(self.id == userId)
 let deleteUser = user.delete()
 do {
 try self.database.run(deleteUser)
 } catch {
 print(error)
 }
 }
 alert.addAction(action)
 present(alert, animated: true, completion: nil)
 }
 }
 
 
 */
