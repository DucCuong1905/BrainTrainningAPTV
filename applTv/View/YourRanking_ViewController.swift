//
//  Frame23_RankingNextViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 23/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

//
//  Frame23_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 22/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class YourRanking_ViewController: UIViewController {
    var listData: [ModelData] = [ModelData]()
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        viewCenter.layer.cornerRadius = self.viewCenter.frame.width/50.0
        tableView.register(UINib(nibName: "Frame23_RankingNext_TableViewCell", bundle: nil), forCellReuseIdentifier: "Frame23_RankingNext_TableViewCell")
        self.addData()
        tableView.dataSource = self
        tableView.delegate = self
        self.viewCenter.layer.cornerRadius = self.viewCenter.frame.width/50.0;
        
        self.viewCenter.layer.borderWidth = 10
        self.viewCenter.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
    }
    
    @IBAction func buttonBackToHome(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home_ViewController") as? Home_ViewController else { return  }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func addData(){
        listData.append(ModelData(ratings: 01, imageAvatar: "Rectangle 875 (1)", name: "You", scores: 3000))
        listData.append(ModelData(ratings: 02, imageAvatar: "Rectangle 876 (3)", name: "Tom Lesin", scores: 9000))
        listData.append(ModelData(ratings: 03, imageAvatar: "Rectangle 877 (3)", name: "Tom Ashe", scores: 2000))
        listData.append(ModelData(ratings: 04, imageAvatar: "Rectangle 878 (2)", name: "Tom Yasuo", scores: 1000))
        listData.append(ModelData(ratings: 05, imageAvatar: "Rectangle 879", name: "Tom Singer", scores: 6000))
    }
}

extension YourRanking_ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Frame23_RankingNext_TableViewCell", for: indexPath) as? RankingOfYou_TableViewCell else {
            return UITableViewCell()
        }
        if listData[indexPath.row].ratings == 1 {
            cell.goldCupImage.image = UIImage(named: "Rectangle 79")
        }
        cell.ratingsLabel.text = "0" + String(listData[indexPath.row].ratings ?? 0)
        cell.name.text = listData[indexPath.row].name
//        if cell.name.text? == "you"  {
//            cell.name.textColor = UIColor(ciColor: .FC72FF)
//        }
        cell.scoresLabel.text = String(listData[indexPath.row].scores ?? 0)
        cell.avatarImage.image = UIImage(named: listData[indexPath.row].imageAvatar ?? "")
        return cell
    }
    
    
}

