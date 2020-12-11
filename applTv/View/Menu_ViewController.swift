//
//  Frame2_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 20/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class Menu_ViewController: UIViewController {
    
    @IBOutlet weak var labelNameUser: UILabel!
    @IBOutlet weak var imageNameUser: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        labelNameUser.text = SqliteService.share.findUserData(id: StaticId.shareIdStatic.id).name 
        imageNameUser.image = UIImage(named: SqliteService.share.findUserData(id: StaticId.shareIdStatic.id).picture ?? "")
        image3.image = UIImage(named: "Rectangle 52")
        image4.image = UIImage(named: "Rectangle 49")
        image5.image = UIImage(named: "Rectangle 50")
        image7.image = UIImage(named: "Rectangle 53")
        image8.image = UIImage(named: "Rectangle 51")
        
        
    }

    

    @IBAction func buttonRundum(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Random_ViewController") as? Random_ViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
        }
    @IBAction func buttunSetting(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Setting_ViewController") as? Setting_ViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    @IBAction func buttonGeneralKnowledge(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuGeneralKnowledgeViewController") as? MenuGeneralKnowledgeViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonPuzzles(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuPuzzles_ViewController") as? MenuPuzzles_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func buttonLogicalReasoning(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuLogicalReasoning_ViewController") as? MenuLogicalReasoning_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonCurrentAffairs(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuCurrentAffairsViewController") as? MenuCurrentAffairsViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func buttonVerbalAbility(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuVerbalAbilityViewController") as? MenuVerbalAbilityViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation..General Knowledge  Puzzles
         
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
