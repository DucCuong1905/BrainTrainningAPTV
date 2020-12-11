//
//  LogIn_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 26/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class LogIn_ViewController: UIViewController {

    @IBOutlet weak var imageLogin: UIImageView!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var viewCenter: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)

        textFieldName.layer.cornerRadius = textFieldName.frame.size.height/2
        textFieldName.clipsToBounds = true
        textFieldPass.layer.cornerRadius = textFieldName.frame.size.height/2
        textFieldPass.clipsToBounds = true

       self.viewCenter.layer.cornerRadius = self.view.frame.width/100.0;
        
    }

    @IBAction func buttonDone(_ sender: Any) {
        if textFieldName.text == "" || textFieldPass.text == "" {
            let alert = UIAlertController(title: "Explanation", message: "name and password not null", preferredStyle: UIAlertController.Style.alert)
            let alertActionCancel  = UIAlertAction(title: "Cancel", style: .default) {(act) in
            }
            let alertActionToSignUp = UIAlertAction(title: "Sign up", style: .default) {(act) in
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUp_ViewController") as? SignUp_ViewController else { return  }
                let navigationController = UINavigationController(rootViewController: vc)
                self.present(navigationController, animated: true, completion: nil)
            }
            alert.addAction(alertActionCancel)
            alert.addAction(alertActionToSignUp)
            self.present(alert, animated: true, completion: nil)
        }else{
            SqliteService.share.checkConnecDB()
            SqliteService.share.showListUsers()
            let listDataUser = SqliteService.share.getAllData()
            for user in listDataUser {
                if  user.name == textFieldName.text &&  user.password == textFieldPass.text {
                    print("login succecc")
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeScreen_ViewController") as? WelcomeScreen_ViewController else { return  }
                    StaticId.shareIdStatic.id = user.id
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                }
            }
            let alert = UIAlertController(title: "Explanation", message: "Name and password are not correct", preferredStyle: UIAlertController.Style.alert)
            let alertActionCancel  = UIAlertAction(title: "Cancel", style: .default) {(act) in
            }
            let alertActionToSignUp = UIAlertAction(title: "Sign up", style: .default) {(act) in
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUp_ViewController") as? SignUp_ViewController else { return  }
                let navigationController = UINavigationController(rootViewController: vc)
                self.present(navigationController, animated: true, completion: nil)
            }
            alert.addAction(alertActionCancel)
            alert.addAction(alertActionToSignUp)
            self.present(alert, animated: true, completion: nil)
        }
    }
        
        
    }
    
    


