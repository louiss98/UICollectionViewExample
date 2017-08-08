//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Stefan Louis on 8/8/17.
//  Copyright © 2017 Stefan Louis. All rights reserved.
//

import UIKit

//This is your main view controller
class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //Configure CollectionView Layout
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 1
        }
        collectionView?.isPagingEnabled = false
        collectionView?.backgroundColor = UIColor.white
        navigationController?.isNavigationBarHidden = true
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake( 50 , 0, 0, 0)
        
    }
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        //Register Cell
        collectionView?.register(Cell.self, forCellWithReuseIdentifier: cellId)
    }
    
    var cell: Cell?
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! Cell
        
        cell.section = indexPath.item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: (view.frame.height / 10))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
