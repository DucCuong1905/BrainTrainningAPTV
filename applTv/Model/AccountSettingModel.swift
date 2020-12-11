//
//  AccountSettingModel.swift
//  applTv
//
//  Created by NguyenhuySOn on 11/5/20.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import Foundation

class AccountModel {
    var id: Int?
    var name: String?
    var password: String?
    var picture: String?
    var score: Int?
    
    init(id: Int? ,name: String?, pass: String?, picture: String?, score: Int? ){
        self.id = id
        self.name = name
        self.password = pass
        self.picture = picture
        self.score = score
    }
}
