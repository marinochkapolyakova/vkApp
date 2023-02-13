//
//  CellCollectionViewCell.swift
//  VKK
//
//  Created by marinapolyakova on 15.12.2022.
//

import UIKit
import SDWebImage

class CellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    
    func configCell(imageUrl: String?){
        if imageUrl != nil{
            self.image.sd_setImage(with: URL(string: imageUrl!))
        }
    }
    
    
}
