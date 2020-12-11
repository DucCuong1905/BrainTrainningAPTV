//
//  Frame31_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 20/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit
import SQLite


class SignUp_ViewController: UIViewController {
//    var idus: Int?
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var viewCenter: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingLayout()
    }
    
    func settingLayout(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        textFieldName.layer.cornerRadius = textFieldName.frame.size.height/2
        textFieldName.clipsToBounds = true
        textFieldPass.layer.cornerRadius = textFieldName.frame.size.height/2
        textFieldPass.clipsToBounds = true
        self.viewCenter.layer.cornerRadius = self.view.frame.width/100.0;
    }
    
    
    @IBAction func buttonNext(_ sender: Any) {
        if textFieldName.text == "" || textFieldPass.text == "" {
            let alert = UIAlertController(title: "Explanation", message: "name and pass not null", preferredStyle: UIAlertController.Style.alert)
            let alertActionOk = UIAlertAction(title: "OK", style: .default) {(act) in
            }
            alert.addAction(alertActionOk)
            self.present(alert, animated: true, completion: nil)
        }else{
            
            SqliteService.share.checkConnecDB()
            SqliteService.share.createTable()

            SqliteService.share.showListUsers()
            SqliteService.share.insertUser(name: textFieldName.text, pass: textFieldPass.text)
            
            let lists = SqliteService.share.getAllData()
            for item in lists {
                if item.name == textFieldName.text && item.password == textFieldPass.text {
                    StaticId.shareIdStatic.id = item.id
                    break
                }
            }
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChooseAvatar_ViewController") as? ChooseAvatar_ViewController else { return  }
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    
    
}


