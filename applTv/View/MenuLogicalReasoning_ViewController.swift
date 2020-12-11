//
//  MenuLogicalReasoning_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 06/11/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class MenuLogicalReasoning_ViewController: UIViewController {

   
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
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionSpottingErrorsViewController") as? QuestionSpottingErrorsViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func buttonNumberpuzzles(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionAntonymsViewController") as? QuestionAntonymsViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonLogicalReasoning(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionSpellingsViewController") as? QuestionSpellingsViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonCurrentAffairs(_ sender: Any) {
       guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionOrderingOfWord_ViewController") as? QuestionOrderingOfWord_ViewController else { return  }
       let navigationController = UINavigationController(rootViewController: vc)
       self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonVerbalAbility(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionSentenceImprovementViewController") as? QuestionSentenceImprovementViewController else { return  }
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

