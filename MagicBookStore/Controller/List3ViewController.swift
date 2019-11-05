//
//  List3ViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/5.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class List3ViewController: UIViewController {
    
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
        collectionView.register(UINib(nibName: "OwnedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OwnedGridCell")
    }
}


extension List3ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return thirdLevelMagics.count
    }
    
    // 設定 CollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let thirdLevelMagic = thirdLevelMagics[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OwnedGridCell", for: indexPath) as! OwnedCollectionViewCell
        
        cell.setInformationForOwned(information: thirdLevelMagic)
        
        return cell
    }
}


extension List3ViewController: UICollectionViewDelegateFlowLayout {
    
    //  設定 CollectionViewCell 的寬、高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width / 4 , height: 80)
    }
}
