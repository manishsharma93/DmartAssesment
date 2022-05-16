//
//  GridCollectionViewCell.swift
//  DmartAssesment
//
//  Created by Manish Kumar on 26/03/20.
//  Copyright © 2020 Manish Kumar. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
    }

}
