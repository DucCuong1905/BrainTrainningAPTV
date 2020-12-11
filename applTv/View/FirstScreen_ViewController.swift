//
//  FirstScreen_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 23/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class FirstScreen_ViewController: UIViewController {

    @IBOutlet weak var outletButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        // Do any additional setup after loading the view.
        SqliteService.share.checkConnecDB()
        SqliteService.share.showListUsers()
        
        StaticAudio.sharaAudio.playAudio()
        let image = UIImage(named: "audioFalse") as UIImage?
        outletButton.setImage(image, for: .normal)
//        outletButton.backgroundImage(for: UIImage(named: ))
    }
    @IBAction func buttonADO(_ sender: Any) {
        if StaticAudio.sharaAudio.check == true {
            let image = UIImage(named: "audioTrue") as UIImage?
            outletButton.setImage(image, for: .normal)
            StaticAudio.sharaAudio.stopAudio()
        }else{
            let image = UIImage(named: "audioFalse") as UIImage?
            outletButton.setImage(image, for: .normal)
            StaticAudio.sharaAudio.playAudio()
        }
    }
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let button = context.nextFocusedItem as? UIButton{
            coordinator.addCoordinatedAnimations({
                button.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
            }, completion: nil)
            
        }
        if let button = context.previouslyFocusedItem as? UIButton{
            coordinator.addCoordinatedAnimations({
                button.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }

    @IBAction func buttonLogIn(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogIn_ViewController") as? LogIn_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func buttonSignUp(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUp_ViewController") as? SignUp_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    

}
