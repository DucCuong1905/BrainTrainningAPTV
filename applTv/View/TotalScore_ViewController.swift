//
//  Frame14_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 23/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class TotalScore_ViewController: UIViewController {
    var totalScore = 0
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var imageStar: UIImageView!
    @IBOutlet weak var labelScores: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageStar.image = UIImage(named: "Star 5")
        labelScores.text = String(totalScore)
        
        SqliteService.share.updateUserScore(id: StaticId.shareIdStatic.id, score: totalScore)
        viewCenter.layer.cornerRadius = self.viewCenter.frame.width/50.0
        
    }

    @IBAction func buttonDone(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Menu_ViewController") as? Menu_ViewController else { return  }
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
