//
//  Frame8_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 21/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit
class StartPuzzles_ViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backGR")!)
        image1.image = UIImage(named: "Rectangle 56")
        
    }
    @IBAction func buttonStart(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Question_ViewController") as? QuestionNumberPuzzles_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
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
