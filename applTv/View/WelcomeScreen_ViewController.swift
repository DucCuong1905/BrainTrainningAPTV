//
//  Frame33_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 23/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class WelcomeScreen_ViewController: UIViewController {
    
    
    @IBOutlet var viewCenter: UIView!
    @IBOutlet weak var imageAvartar: UIImageView!
    @IBOutlet weak var labelHello: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        imageAvartar.image = UIImage(named: "Rectangle 859-1")
        

        
        let us = SqliteService.share.findUserData(id: StaticId.shareIdStatic.id)
        
        self.labelHello.text = "Hello " + us.name!  + "! Welcome to Brain Training! "
        self.imageAvartar.image = UIImage(named: us.picture ?? "")
        

        
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home_ViewController") as? Home_ViewController else { return  }
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
