//
//  Cell2.swift
//  CollectionViewTest
//
//  Created by Stefan Louis on 8/8/17.
//  Copyright © 2017 Stefan Louis. All rights reserved.
//

import Foundation
import UIKit

//This is your interior collectionViews cell object
class Cell2: BaseCell {
    
    let textLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 20)
        l.backgroundColor = UIColor.clear
        l.text = "Pg "
        l.textAlignment = .center
        return l
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.white
        
        addSubview(textLabel)
        addConstraintsWithFormat("H:|[v0]|", views: textLabel)
        addConstraintsWithFormat("V:|[v0]|", views: textLabel)

    }
}
