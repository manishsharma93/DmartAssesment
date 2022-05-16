//
//  ListTableViewCell.swift
//  DmartAssesment
//
//  Created by Manish Kumar on 26/03/20.
//  Copyright © 2020 Manish Kumar. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        if productQuantityLabel.text == "0" {
            minusButton.isEnabled = false
        } else {
            minusButton.isEnabled = true
            let quantity : Int = (productQuantityLabel.text! as NSString).integerValue
            productQuantityLabel.text = "\(quantity - 1)"
            
            if productQuantityLabel.text == "0" {
                minusButton.isEnabled = false
            }
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let quantity : Int = (productQuantityLabel.text! as NSString).integerValue
        productQuantityLabel.text = "\(quantity + 1)"
        minusButton.isEnabled = true
    }
}
