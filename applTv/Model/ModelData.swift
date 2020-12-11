//
//  ModelData.swift
//  applTv
//
//  Created by dev-sonpipi on 22/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import Foundation
class UserData: NSObject {
    var ratings: Int?
    var imageAvatar: String?
    var name: String?
    var scores: Int?
    
    init(ratings: Int, imageAvatar: String, name: String, scores: Int) {
        self.ratings = ratings
        self.imageAvatar = imageAvatar
        self.name = name
        self.scores = scores
    }
}
