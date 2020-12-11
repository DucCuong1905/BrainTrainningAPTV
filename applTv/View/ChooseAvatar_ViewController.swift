//
//  Frame32_ViewController.swift
//  applTv
//
//  Created by dev-sonpipi on 22/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class ChooseAvatar_ViewController: UIViewController {
    var imageAvt: String?
    var userId = StaticId.shareIdStatic.id

    var listImageAvartar: [String] = ["Rectangle 875 (1)", "Rectangle 888", "Rectangle 887", "Rectangle 886",  "Rectangle 885 (1)",  "Rectangle 884",  "Rectangle 883",  "Rectangle 882 (1)",  "Rectangle 881",  "Rectangle 880",  "Rectangle 879",  "Rectangle 878 (2)", "Rectangle 877 (3)", "Rectangle 876 (3)"]
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewCenter.layer.cornerRadius = self.viewCenter.frame.width/50.0;
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "br")!)
        collectionView.register(UINib(nibName: "Frame32_CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Frame32_CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        var cellWidth = 0
        if UIDevice.current.userInterfaceIdiom == .pad {
            cellWidth = Int(UIScreen.main.bounds.width) / 5 - 10
        } else {
            cellWidth = Int(UIScreen.main.bounds.width) / 7 - 10
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellWidth, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        flowLayout.minimumInteritemSpacing = 0.0
        collectionView.collectionViewLayout = flowLayout
        collectionView.scrollToItem(at: IndexPath(item: 2, section: 0), at: .centeredVertically, animated: true)
        
        
        
    }
    
}

extension ChooseAvatar_ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listImageAvartar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Frame32_CollectionViewCell", for: indexPath) as? ChoiceAvatar_CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.transform = CGAffineTransform.identity
        cell.imageAvartar.image = UIImage(named: listImageAvartar[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.imageAvt = listImageAvartar[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath) as? ChoiceAvatar_CollectionViewCell
        cell?.imageCheckChoice.image = UIImage(named: "Vector 3")
        
        SqliteService.share.updateUserAvatar(id: self.userId, picture: self.imageAvt)
        
        guard let vc = storyboard?.instantiateViewController(identifier: "WelcomeScreen_ViewController") as? WelcomeScreen_ViewController else{ return }
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
}


extension ChooseAvatar_ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/16, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let cell = context.previouslyFocusedView as? UICollectionViewCell {
            coordinator.addCoordinatedAnimations({ () -> Void in
                cell.transform = CGAffineTransform.identity
                cell.layer.borderWidth = 0
                cell.backgroundColor = .clear
            }, completion: nil)
        }
        else if let button = context.previouslyFocusedView as? UIButton{
            coordinator.addCoordinatedAnimations({ () -> Void in
                button.transform = CGAffineTransform.identity
                if #available(tvOS 13.0, *) {
                    button.layer.borderColor  = .init(srgbRed: 0, green: 0, blue: 0, alpha: 1)
                } else {
                }
                button.setTitleColor(.black, for: .normal)
            }, completion: nil)
        }
        if let cell = context.nextFocusedView as? UICollectionViewCell {
            coordinator.addCoordinatedAnimations({ () -> Void in
                cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                cell.layer.borderWidth = 1
                cell.backgroundColor = .clear
            }, completion: nil)
        }
        else if let button = context.nextFocusedItem as? UIButton{
            coordinator.addCoordinatedAnimations({ () -> Void in
                button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                if #available(tvOS 13.0, *) {
                    button.layer.borderColor  = .init(srgbRed: 255, green: 0, blue: 0, alpha: 1)
                } else {
                }
                button.setTitleColor(.red, for: .normal)
            }, completion: nil)
        }
    }
    
}

