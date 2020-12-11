//
//  MenuVerbalAbilityViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 06/11/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class MenuVerbalAbilityViewController: UIViewController {
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backGR")!)
        image2.image = UIImage(named: "Rectangle 59")
        image3.image = UIImage(named: "Rectangle 56")
        image4.image = UIImage(named: "Rectangle 62")
        image5.image = UIImage(named: "Rectangle 60")
        image6.image = UIImage(named: "Rectangle 61")
        // Do any additional setup after loading the view. buttonVerbalAbility
    }
    @IBAction func buttonPlayingcardspuzzles(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionStateLatestCurrentAffairsViewController") as? QuestionStateLatestCurrentAffairsViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func buttonNumberpuzzles(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionNationalLatestCurrentAffairsViewController") as? QuestionNationalLatestCurrentAffairsViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonLogicalReasoning(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionInternationalLatestCurrentAffairsViewController") as? QuestionInternationalLatestCurrentAffairsViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonCurrentAffairs(_ sender: Any) {
       guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionAgricultureLatestCurrentAffairsViewController") as? QuestionAgricultureLatestCurrentAffairsViewController else { return  }
       let navigationController = UINavigationController(rootViewController: vc)
       self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonVerbalAbility(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionAwardsAndHonoursLatestCurrentAffairsViewController") as? QuestionAwardsAndHonoursLatestCurrentAffairsViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
}

