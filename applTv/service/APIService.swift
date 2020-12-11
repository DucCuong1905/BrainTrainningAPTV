//
//  APIService.swift
//  applTv
//
//  Created by dev-sonpipi on 02/11/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import Foundation


typealias ApiCompletion = (_ data: Any?, _ error: Error?) -> ()

typealias ApiParam = [String: Any]

enum ApiMethod: String {
    case GET = "GET"
    case POST = "POST"
}
extension String {
    func addingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
}

extension Dictionary {
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
            if value is String {
                let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
                return "\(percentEscapedKey)=\(percentEscapedValue)"
            }
            else {
                return "\(percentEscapedKey)=\(value)"
            }
        }
        return parameterArray.joined(separator: "&")
    }
}
class APIService: NSObject {
    static let shared: APIService = APIService()

    func requestSON(_ url: String,
                    param: ApiParam?,
                    method: ApiMethod,
                    loading: Bool,
                    completion: @escaping ApiCompletion)
    {
        var request:URLRequest!
        
        // set method & param
        if method == .GET {
            if let paramString = param?.stringFromHttpParameters() {
                request = URLRequest(url: URL(string:"\(url)?\(paramString)")!)
            }
            else {
                request = URLRequest(url: URL(string:url)!)
            }
        }
        else if method == .POST {
            request = URLRequest(url: URL(string:url)!)
            
            // content-type
            let headers: Dictionary = ["Content-Type": "application/json"]
            request.allHTTPHeaderFields = headers
            
            do {
                if let p = param {
                    request.httpBody = try JSONSerialization.data(withJSONObject: p, options: .prettyPrinted)
                }
            } catch { }
        }
        
        request.timeoutInterval = 30
        request.httpMethod = method.rawValue
        
        //
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                // check for fundamental networking error
                guard let data = data, error == nil else {
                    completion(nil, error)
                    return
                }
                
                // check for http errors
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200, let res = response {
                }
                
                if let resJson = self.convertToJson(data) {
                    completion(resJson, nil)
                }
                else if let resString = String(data: data, encoding: .utf8) {
                    completion(resString, error)
                }
                else {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    private func convertToJson(_ byData: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: byData, options: [])
        } catch {
            //self.debug("convert to json error: \(error)")
        }
        return nil
    }
    //http://api.mangageek.net/comics/features?package_name=net.mangamaster.super&version_code=200&version_name=1.2.0.0&channel=google&sign=6e02c5f1e43cc41efe3b13655f2094c7&platform=android&lang=en&country=US&sim=us
   // https://raw.githubusercontent.com/DucCuong1905/Json/main/cuongjson.json
    
    func GetAllQuestionNumberPuzzles(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=e4c8b07e2a112faf21842e9bcead78d9&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
//            var listFriend:[Friends] = [Friends]()
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    // get data question MissingPuzzles
    func GetAllPlayingCardsPuzzles(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=dd0b35b2c5d448dfea60c0417248c8a1&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
//            var listFriend:[Friends] = [Friends]()
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Logical puzzles
    func GetAllLogicalPuzzles(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=d271c9b071cd635843e32aecfbe2de69&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
//            var listFriend:[Friends] = [Friends]()
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Clock puzzles
    
    func GetAllClockPuzzle(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=e13980564a48d8d27bac1376a1562474&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
//            var listFriend:[Friends] = [Friends]()
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    
    
    
    
    // get data question MissingPuzzles
    
    func GetAllQuestionMissingPuzzles(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=470fa92ce8ea49b9887bd8ab8df2e4a8&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question NumberSeries
    func GetAllQuestionNumberSeries(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=a63a9e6d03953853fb4b4c0e68d40e0b&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    
    // get data question  National
    func GetAllQuestionNational(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=5c274f44867a02757dd2cab7d92401ac&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    // get data question Analogies International
    func GetAllQuestionAnalogies(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=50bebf09b56b0b29a347231b5774a97f&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    // get data question Matching Definitions
    func GetAllQuestionMatchingDefinitions(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=84a5bdad3c4feb89771f1eb500d5ed71&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    // get data question Verbal Reasoning
    func GetAllQuestionVerbalReasoning(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=8676da2a847f136d67dded192f191b4f&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    
    
    // get data question Spotting Errors
    func GetAllQuestionSpottingErrors(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=cc80e2cdfe5ffbc40b81347db9134e77&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Antonyms
    func GetAllQuestionAntonyms(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=d12aa3ed27faa840c29be50240d2669c&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Spellings
    func GetAllQuestionSpellings(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=00744860a75de8d6c5dee5ac8d4b9b08&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Ordering of Words
    func GetAllQuestionOrderingOfWords(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=36e4880afd4ffffeb4a0c333df2a03b9&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    // get data question Sentence Improvements
    func GetAllQuestionSentenceImprovement(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=4a15fa25cb569a0349954249fb59a9ae&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    
    
    // get data question Basic General Knowledge
    func GetAllQuestionBasicGeneralKnowledge(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=9e6610efa935ddbf12e3e943c2f6e10c&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question General Science
    func GetAllQuestionGeneralScience(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=9c6e7ff92433d63190ffd6dc2b922902&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Indian Politics
    func GetAllQuestionIndianPolitics(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=78aeceb25a6c83d3f50bb4703403ec00&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question World Geography
    func GetAllQuestionWorldGeography(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=09f1004373784c06d3a8b4fe6f6ea0e4&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Chemistry
    func GetAllQuestionChemistry(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=94c91ff96e1e380913d2aa671f7204e3&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
    
    
    
    
    
    // get data question State - Latest Current Affairs
    func GetAllQuestionStateLatestCurrentAffairs(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=fd0fee5b49bf13a105065606b08395f7&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question National - Latest Current Affairs
    func GetAllQuestionNationalLatestCurrentAffairs(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=5c274f44867a02757dd2cab7d92401ac&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question International - Latest Current Affairs
    func GetAllQuestionInternationalLatestCurrentAffairs(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=242ff55d55e8a6dacac2c53eef4f99c5&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Agriculture - Latest Current Affairs
    func GetAllQuestionAgricultureLatestCurrentAffairs(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=f9c7d450e107abd765efcad438ffc3ab&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    // get data question Awards and Honours - Latest Current Affairs
    func GetAllQuestionAwardsAndHonoursLatestCurrentAffairs(closure: @escaping (_ response: [QuestionData]?, _ error: Error?) -> Void) {
        requestSON("http://167.99.77.3:6868/iqtest/question?section_id=c996fdbc1e7987b5b000492cc25a54ff&page_size=1000&page_index=1", param: nil, method: .GET, loading: true) { (data, error) in
            if let dataIn = data as? [String: Any]{
                var listDataReturn:[QuestionData] = [QuestionData]()
                if let listData = dataIn["questions"] as? [Any]{
                    for item in listData {
                        var dataAdd = QuestionData()
                        dataAdd = dataAdd.initLoad(item as! [String : Any])
                        listDataReturn.append(dataAdd)
                    }
                }
                closure(listDataReturn, nil)
            }
        }
    }
    
}


