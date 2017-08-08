//
//  Cell.swift
//  CollectionViewTest
//
//  Created by Stefan Louis on 8/8/17.
//  Copyright © 2017 Stefan Louis. All rights reserved.
//

import UIKit

//This is your main view controllers cell object
class Cell: BaseCell, UICollectionViewDataSource {
    
    let interiorCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        //Configures the interior collectionViews Layout
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()
    
    let cell2Id = "cell2Id"
    
    override func setupViews() {
        backgroundColor = UIColor.white
        
        interiorCollectionView.delegate = self
        interiorCollectionView.dataSource = self
        
        //Registering the interior cell
        interiorCollectionView.register(Cell2.self, forCellWithReuseIdentifier: cell2Id)
        
        //Adding the collectionView as a subview
        addSubview(interiorCollectionView)
        addConstraintsWithFormat("H:|[v0]|", views: interiorCollectionView)
        addConstraintsWithFormat("V:|[v0]|", views: interiorCollectionView)
        
    }
    
    lazy var viewController: ViewController = {
        let vc = ViewController()
        vc.cell = self
        return vc
    }()
    
    var section = 0
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell2Id, for: indexPath) as! Cell2
        
        cell.textLabel.text = "Pg \(section).\(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}
