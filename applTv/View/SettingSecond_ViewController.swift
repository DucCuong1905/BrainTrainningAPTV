//
//  Frame10_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 21/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class SettingSecond_ViewController: UIViewController {
    @IBOutlet weak var outletButtonAudio: UIButton!
    @IBOutlet var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = UIColor(patternImage: UIImage(named: "Group 5")!)
        if StaticAudio.sharaAudio.check == true {
            let image = UIImage(named: "audioFalse") as UIImage?
            outletButtonAudio.setImage(image, for: .normal)
        }else{
            let image = UIImage(named: "audioTrue") as UIImage?
            outletButtonAudio.setImage(image, for: .normal)
        }
    }
    @IBAction func buttonSettingAudio(_ sender: Any) {
        if StaticAudio.sharaAudio.check == true {
            let image = UIImage(named: "audioTrue") as UIImage?
            outletButtonAudio.setImage(image, for: .normal)
            StaticAudio.sharaAudio.stopAudio()
        }else{
            let image = UIImage(named: "audioFalse") as UIImage?
            outletButtonAudio.setImage(image, for: .normal)
            StaticAudio.sharaAudio.playAudio()
        }
    }
    @IBAction func buttonContinue(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonBackToHome(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuPuzzles_ViewController") as? MenuPuzzles_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    

}
