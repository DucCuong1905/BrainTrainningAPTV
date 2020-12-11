//
//  Frame30_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 21/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class LogIn_ViewController: UIViewController {

    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var viewCenter: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldName.layer.cornerRadius = textFieldName.frame.size.height/2
        textFieldName.clipsToBounds = true
        textFieldPass.layer.cornerRadius = textFieldName.frame.size.height/2
        textFieldPass.clipsToBounds = true
        textFieldName.attributedPlaceholder = NSAttributedString(string: "Display name",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textFieldPass.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
       self.viewCenter.layer.cornerRadius = self.view.frame.width/100.0;
    }


    /*
    // MARK: - Navigation.UIColor.red.cgColor

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
