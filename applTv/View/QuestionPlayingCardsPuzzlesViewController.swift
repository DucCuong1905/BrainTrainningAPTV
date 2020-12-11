//
//  QuestionPlayingCardsPuzzlesViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 05/11/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit
import Kingfisher


class QuestionPlayingCardsPuzzlesViewController: UIViewController {

    var ourTimer = Timer()
    var listData = [QuestionData]()
    var rd = Int.random(in: 0..<10)
    var numberFalse = 3
    var score = 0
    
    var checkTime = true
    var explanation: String?
    var answer: String?
    
    var indexQuestion = 0
    
    @IBOutlet weak var labelNumberFalse: UILabel!

    @IBOutlet weak var labelScore: UILabel!
    
    @IBOutlet weak var imageTrueFalseA: UIImageView!
    @IBOutlet weak var imageTrueFalseB: UIImageView!
    @IBOutlet weak var imageTrueFalseC: UIImageView!
    @IBOutlet weak var imageTrueFalseD: UIImageView!
    
    @IBOutlet weak var orderQuestion: UILabel!
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var outletBTA: UIButton!
    @IBOutlet weak var outletBTB: UIButton!
    @IBOutlet weak var outletBTC: UIButton!
    @IBOutlet weak var outletBTD: UIButton!
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var viewCountdownTime: LinearProgressBar!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        self.getHomeNimeManga()
        
        image1.image = UIImage(named: "Group 2")
        image2.image = UIImage(named: "Star 4")
        view2.backgroundColor = UIColor(patternImage: UIImage(named: "Rectangle 8 (1)")!)
        viewCountdownTime.backgroundColor = .clear
    }
    func getHomeNimeManga() {
        APIService.shared.GetAllPlayingCardsPuzzles() { [self] (response, error) in
            if let listData1 = response{
                self.listData = listData1
                self.loadQuestion()
                self.startBT()
            }
        }
    }
    
    func loadQuestion(){
        labelNumberFalse.text = String(numberFalse)
        labelScore.text = String(score)
        
        let listAnswer = ["10 of Clubs", "6 of Clubs", "2 of Clubs", "4 of Clubs", "2 of Clubs", "3 of Clubs", "5 of Clubs", "7 of Clubs", "2 of SpadeS", "4 of SpadeS", "5 of SpadeS", "6 of SpadeS", "7 of SpadeS", "8 of SpadeS", "9 of SpadeS", "10 of Spad" ]
        let answerRD = listAnswer.randomElement()
        let answerRD2 = listAnswer.randomElement()
        let answerRD3 = listAnswer.randomElement()
            explanation = listData[indexQuestion].explanation
            answer = listData[indexQuestion].answer_true_text
            
            
            let randomAnswer = Int.random(in: 0..<4)
        orderQuestion.text = "Question " + String(indexQuestion) + "/" + String(listData.count)
            let url = URL(string: listData[indexQuestion].question_image ?? "")
            imageQuestion.kf.setImage(with: url)
            if randomAnswer == 0{
                outletBTA.setTitle(answerRD, for: .normal)
                outletBTB.setTitle(listData[indexQuestion].answer_true_text, for: .normal)
                outletBTC.setTitle(answerRD2, for: .normal)
                outletBTD.setTitle(answerRD3, for: .normal)
            }else if randomAnswer == 1{
                outletBTA.setTitle(answerRD2, for: .normal)
                outletBTB.setTitle(answerRD3, for: .normal)
                outletBTC.setTitle(listData[indexQuestion].answer_true_text, for: .normal)
                outletBTD.setTitle(answerRD, for: .normal)
            }else if randomAnswer == 2{
                outletBTA.setTitle(answerRD2, for: .normal)
                outletBTB.setTitle(answerRD3, for: .normal)
                outletBTC.setTitle(answerRD, for: .normal)
                outletBTD.setTitle(listData[indexQuestion].answer_true_text, for: .normal)
            }else if randomAnswer == 3{
                outletBTA.setTitle(listData[indexQuestion].answer_true_text, for: .normal)
                outletBTB.setTitle(answerRD, for: .normal)
                outletBTC.setTitle(answerRD2, for: .normal)
                outletBTD.setTitle(answerRD3, for: .normal)
            }
//        }
        
    }
    func startBT() {
        ourTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    
    func resetBT() {
        ourTimer.invalidate()
        viewCountdownTime.progressValue = 100
    }
    @objc func action(){
        viewCountdownTime.progressValue -= 5
        if viewCountdownTime.progressValue == 0 {
            numberFalse -= 1
            checkNumberFalase()
            self.alert()
        }
    }
    func checkNumberFalase() {
        if self.numberFalse <= 0 {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "TotalScore_ViewController") as? TotalScore_ViewController else { return }
            vc.totalScore = score
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    @IBAction func buttonSetingg(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SettingSecond_ViewController") as? SettingSecond_ViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func buttonAnswerA(_ sender: Any) {
        let a = String(outletBTA.title(for: .normal) ?? "")
        if a == answer {
            imageTrueFalseA.image = UIImage(named: "Vector 3")
            score += 10
        }else{
            imageTrueFalseA.image = UIImage(named: "image6")
            self.numberFalse -= 1
            self.checkNumberFalase()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.alert()
        }
        
    }
    
    @IBAction func buttonAnswerB(_ sender: Any) {
        let b = String(outletBTB.title(for: .normal) ?? "")
        if b == answer {
            imageTrueFalseB.image = UIImage(named: "Vector 3")
            score += 10
        }else{
            imageTrueFalseB.image = UIImage(named: "image6")
            self.numberFalse -= 1
            self.checkNumberFalase()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.alert()
        }
    }
    
    @IBAction func buttonAnswerC(_ sender: Any) {
        let c = String(outletBTC.title(for: .normal) ?? "")
        if c == answer {
            imageTrueFalseC.image = UIImage(named: "Vector 3")
            score += 10
        }else{
            imageTrueFalseC.image = UIImage(named: "image6")
            self.numberFalse -= 1
            self.checkNumberFalase()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.alert()
        }
    }
    
    @IBAction func buttonAnswerD(_ sender: Any) {
        let d = String(outletBTD.title(for: .normal) ?? "")
        if d == answer {
            imageTrueFalseD.image = UIImage(named: "Vector 3")
            score += 10
        }else{
            imageTrueFalseD.image = UIImage(named: "image6")
            self.numberFalse -= 1
            self.checkNumberFalase()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.alert()
        }
    }
    
    
    func alert() {
        let alert = UIAlertController(title: "Explanation", message: explanation, preferredStyle: UIAlertController.Style.alert)
        let alertActionOk = UIAlertAction(title: "OK", style: .default) {(act) in
            self.startBT()
        }
        self.resetBT()
        indexQuestion += 1
        if indexQuestion == listData.count - 1  {

                    guard let vc = storyboard?.instantiateViewController(withIdentifier: "TotalScore_ViewController") as? TotalScore_ViewController else { return }
                    vc.totalScore = score
                    vc.modalPresentationStyle = .overFullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    present(vc, animated: true)
        }
        loadQuestion()
        imageTrueFalseA.image = UIImage(named: "")
        imageTrueFalseB.image = UIImage(named: "")
        imageTrueFalseC.image = UIImage(named: "")
        imageTrueFalseD.image = UIImage(named: "")
        alert.addAction(alertActionOk)
        self.present(alert, animated: true, completion: nil)
    }

    
}


/*
 let alert = UIAlertController(title: "MESSAGE", message: "you want go to Third screen", preferredStyle: .alert)
 let alertActionOk = UIAlertAction(title: "OK", style: .default) {(act) in
     self.loadScrenThird()
     print("action ok") //action khi nhấn nút OK
 }
 let alertActionDestructive = UIAlertAction(title: "Destructive", style: .destructive) { (act) in
     print("action destructive")
     
 }
 let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (act) in
     print("action destructive") //action khi nhấn nút Cancel
 }
 //them cai action vao alert
 alert.addAction(alertActionOk)
 alert.addAction(alertActionDestructive)
 alert.addAction(alertActionCancel)
 // hien thi alert
 self.present(alert, animated: true, completion: nil)
 */
