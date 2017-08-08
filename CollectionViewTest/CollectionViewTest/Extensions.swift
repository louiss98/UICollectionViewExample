//
//  Extensions.swift
//  CollectionViewTest
//
//  Created by Stefan Louis on 8/8/17.
//  Copyright © 2017 Stefan Louis. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraintsWithFormat(_ format: String, views : UIView...) {
        
        
        var viewsDictionary = [String: UIView]()
        
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}

class BaseCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:)has not been implemented")
    }
    func setupViews(){
        backgroundColor = UIColor.black
    }
}

