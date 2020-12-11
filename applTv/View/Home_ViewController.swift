//
//  Frame1_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 20/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class Home_ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var labetHi: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        myImage.image = UIImage(named: SqliteService.share.findUserData(id: StaticId.shareIdStatic.id).picture ?? "")
        labetHi.text =  "Hi " +  SqliteService.share.findUserData(id: StaticId.shareIdStatic.id).name! + "!"
        // Do any additional setup after loading the view.
        SqliteService.share.checkConnecDB()
        SqliteService.share.showListUsers()
        
        

    }

    @IBAction func buttonStart(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Menu_ViewController") as? Menu_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func buttonRank(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Ranking_ViewController") as? Ranking_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation  General Knowledge Current Affairs
     Puzzles Logical Reasoning Verbal Ability
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
