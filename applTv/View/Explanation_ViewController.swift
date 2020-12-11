//
//  Explanation_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 04/11/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class Explanation_ViewController: UIViewController {

    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var explanationLabel: UILabel!
    
    var textExplanation: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCenter.layer.cornerRadius = viewCenter.frame.width/50
        explanationLabel.text = textExplanation
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonOk(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
