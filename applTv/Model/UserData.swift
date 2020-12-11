//
//  UserData.swift
//  applTv
//
//  Created by nguyenhuyson on 11/3/20.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import Foundation
class UserModel: NSObject {
    private var id: String?
    private var name: String?
    private var pass: String?
    private var avartar: String?
    private var score: Int = 0
    
    static var share = UserModel(name: "", pass: "", avartar: "", Score: 0)
    
    init(name: String?, pass: String?, avartar: String?, Score: Int?) {
        self.name = name
        self.pass = pass
        self.avartar = avartar
        self.score = 0
    }

    var listData: [UserModel] = [UserModel]()
    var your = UserModel(name: "your", pass: "00", avartar: "Rectangle 875 (1)", Score: 0)
    var data1 = UserModel(name: "Tom braum", pass: "11", avartar: "Rectangle 876 (3)", Score: 500)
    var data2 = UserModel(name: "hey leesin", pass: "12", avartar: "Rectangle 877 (3)", Score: 100)
    var data4 = UserModel(name: "lux braum", pass: "fd", avartar: "Rectangle 883", Score: 900)
    var data5 = UserModel(name: "lblang braum", pass: "yu", avartar: "Rectangle 878 (2)", Score: 3000)
    
    func getData() -> [UserModel] {
        listData.append(your)
        listData.append(data1)
        listData.append(data2)
        listData.append(data4)
        listData.append(data5)
        
        return listData
    }
    
    func addNameandpass(name: String?, pass: String?){
        listData[0].name = name
        listData[0].pass = pass
    }
    func addAvartar(avartar: String?){
        listData[0].avartar = avartar
    }
    
    func scorePlus(score: Int!) {
        listData[0].score += score
    }
    
    
}
