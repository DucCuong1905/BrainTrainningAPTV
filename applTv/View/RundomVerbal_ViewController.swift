//
//  Frame29_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 23/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class RundomVerbal_ViewController: UIViewController {
    var rd = Int.random(in: 0..<5)
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var imageRubic: UIImageView!
    @IBOutlet weak var labelNameCategory: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCenter.layer.cornerRadius = self.viewCenter.frame.width/50.0
        imageRubic.image = UIImage(named: "pngegg (1) 1")
        viewCenter.backgroundColor = UIColor(patternImage: UIImage(named: "Group 14")!)
        switch rd {
        case 0:
            labelNameCategory.text = "General Knowledge"
        case 1:
            labelNameCategory.text = "Puzzles"
        case 2:
            labelNameCategory.text = "Logical Reasoning"
        case 3:
            labelNameCategory.text = "Current Affairs"
        case 4:
            labelNameCategory.text = "Verbal Ability"
        default:
            labelNameCategory.text = "other"
        }
        // Do any additional setup after loading the view.
        
    }
    @IBAction func buttonStart(_ sender: Any) {
        switch rd {
        case 0:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuPuzzles_ViewController") as? MenuPuzzles_ViewController else { return  }
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
        case 1:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuLogicalReasoning_ViewController") as? MenuLogicalReasoning_ViewController else { return  }
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
        case 3:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuCurrentAffairsViewController") as? MenuCurrentAffairsViewController else { return  }
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
        case 2:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuLogicalReasoning_ViewController") as? MenuLogicalReasoning_ViewController else { return  }
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
        case 4:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuPuzzles_ViewController") as? MenuGeneralKnowledgeViewController else { return  }
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
        default:
            print("hihi")
        }
    }
    @IBAction func buttonCancel(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuPuzzles_ViewController") as? MenuPuzzles_ViewController else { return  }
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
