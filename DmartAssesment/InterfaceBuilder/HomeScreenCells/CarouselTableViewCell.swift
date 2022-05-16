//
//  CarouselTableViewCell.swift
//  DmartAssesment
//
//  Created by Manish Kumar on 26/03/20.
//  Copyright © 2020 Manish Kumar. All rights reserved.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    var dataArray : [Bucket_data]? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentCollectionView.register(UINib.init(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCollectionViewCell")
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension CarouselTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as? CarouselCollectionViewCell
        let bucket = dataArray?[indexPath.row]

        cell?.bannerImageView.loadImage(bucket?.imageURL ?? "")

        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt called")
        
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //Can use this for showing page control
    }
    
}
