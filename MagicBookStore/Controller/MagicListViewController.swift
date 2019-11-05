//
//  MagicListViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class MagicListViewController: UIViewController {

    var firstLevelMagics = Skill.firstLevel
    var secondLevelMagics = Skill.secondLevel
    var thirdLevelMagics = Skill.thirdLevel
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib()
    }

    @IBAction func backToHome(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    private func registerNib() {
        collectionView.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCell")
    }
    
}


extension MagicListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return firstLevelMagics.count
    }
    
    // 設定 CollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let firstLevelMagic = firstLevelMagics[indexPath.item]
        let secondLevelMagic = secondLevelMagics[indexPath.item]
        let thirdLevelMagic = thirdLevelMagics[indexPath.item]
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCollectionViewCell
            
        cell.setInformationForShop(information: firstLevelMagic)
                
        return cell
    }
}


extension MagicListViewController: UICollectionViewDelegateFlowLayout {
    
    //  設定 CollectionViewCell 的寬、高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: collectionView.frame.size.width / 4 , height: 100)
    }
}
