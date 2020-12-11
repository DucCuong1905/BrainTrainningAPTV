//
//  Frame6_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 20/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class Setting_ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var outletButtonAudio: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "brF3")!)
        myView.backgroundColor = UIColor(patternImage: UIImage(named: "Rectangle 8")!)
        
        if StaticAudio.sharaAudio.check == true {
            let image = UIImage(named: "audioFalse") as UIImage?
            outletButtonAudio.setBackgroundImage(image, for: .normal)
        }else{
            let image = UIImage(named: "audioTrue") as UIImage?
            outletButtonAudio.setBackgroundImage(image, for: .normal)
        }
    }
    @IBAction func buttonShare(_ sender: Any) {
    }
    
    @IBAction func buttonRate(_ sender: Any) {
    }
    @IBAction func buttonChoiceAvatar(_ sender: Any) {
        guard let vc = (storyboard?.instantiateViewController(identifier: "ChooseAvatar_ViewController")) as? ChooseAvatar_ViewController else { return }
        let navicationController = UINavigationController(rootViewController: vc)
        self.present(navicationController, animated: true, completion: nil)
    
    }
    
    @IBAction func buttonSettingAudio(_ sender: Any) {
        if StaticAudio.sharaAudio.check == true {
            let image = UIImage(named: "audioFalse") as UIImage?
            outletButtonAudio.setBackgroundImage(image, for: .normal)
            StaticAudio.sharaAudio.stopAudio()
        }else{
            let image = UIImage(named: "audioFalse") as UIImage?
            outletButtonAudio.setBackgroundImage(image, for: .normal)
            StaticAudio.sharaAudio.playAudio()
        }
    }
    
    
    
    
    /*/Users/dev-sonpipi/Documents/braintrainingtvos/applTv/View/SettingSecond_ViewController.swift
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
