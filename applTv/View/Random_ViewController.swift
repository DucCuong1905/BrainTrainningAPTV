//
//  Frame3_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 22/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class Random_ViewController: UIViewController {

    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var viewRadius: UIView!

    @IBOutlet weak var activity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activity.startAnimating()
        self.viewCenter.backgroundColor = UIColor(patternImage: UIImage(named: "Group 14")!)
        self.viewRadius.backgroundColor = UIColor(patternImage: UIImage(named: "Ellipse 2")!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "RundomVerbal_ViewController") as? RundomVerbal_ViewController else{  return }
            let navigationController = UINavigationController(rootViewController: vc)
//            activity.stopAnimating()
            self.present(navigationController, animated: true, completion: nil)
        }
        
            
        
        // Do any additional setup after loading the view.
    }


    

}
