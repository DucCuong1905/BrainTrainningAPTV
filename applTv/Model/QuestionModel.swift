//
//  QuestionModel.swift
//  applTv
//
//  Created by dev-sonpipi on 30/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import Foundation
protocol QuestionDataDelegate {
    func didReceiveData(data: [QuestionData])
}
class QuestionData: NSObject{
    var type: String?
    var answers: [String]?
    var explanation: String?
    var show: Bool?
    var section_id: String?
    var question_image: String?
    var question_text: String?
    var answer_true_text: String?
    var answer_true_index: String?
    
    func initLoad(_ json:  [String: Any]) -> QuestionData{
        if let temp = json["id"] as? String { type = temp }
        if let temp = json["answers"] as? [String] { answers = temp }
        if let temp = json["explanation"] as? String { explanation = temp }
        if let temp = json["show"] as? Bool { show = temp }
        if let temp = json["section_id"] as? String { section_id = temp }
        if let temp = json["question_image"] as? String { question_image = temp }
        if let temp = json["question_text"] as? String { question_text = temp }
        if let temp = json["answer_true_text"] as? String { answer_true_text = temp }
        if let temp = json["answer_true_index"] as? String { answer_true_index = temp }
        return self
    }
    
   
}


