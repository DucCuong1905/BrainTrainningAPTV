//
//  Frame23_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 22/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class Ranking_ViewController: UIViewController {
    var listUser = SqliteService.share.getAllData()
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        tableView.register(UINib(nibName: "Frame23_TableViewCell", bundle: nil), forCellReuseIdentifier: "Frame23_TableViewCell")
        self.addData()
        tableView.dataSource = self
        tableView.delegate = self
        self.viewCenter.layer.cornerRadius = self.viewCenter.frame.width/50.0;
        self.viewCenter.layer.borderWidth = 10
        self.viewCenter.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        
        listUser = listUser.sorted(by: {$0.score! > $1.score!})
        
        
        
    }
    
    @IBAction func buttonBackToHome(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home_ViewController") as? Home_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    func addData(){
      
    }
}

extension Ranking_ViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Frame23_TableViewCell", for: indexPath) as? RanKingMax_TableViewCell else {
            return UITableViewCell()
        }
        if indexPath.row == 0 {
            cell.goldCupImage.image = UIImage(named: "Rectangle 79")
            cell.name.textColor = .red
        }
        cell.ratingsLabel.text = String(indexPath.row + 1)
        
        cell.avatarImage.image = UIImage(named: listUser[indexPath.row].picture ?? "")
        cell.name.text = listUser[indexPath.row].name ?? ""
        cell.scoresLabel.text = String( listUser[indexPath.row].score ?? 0)

        return cell
    }
    
    
}
