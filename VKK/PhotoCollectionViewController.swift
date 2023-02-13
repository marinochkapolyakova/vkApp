//
//  PhotoCollectionViewController.swift
//  VKK
//
//  Created by marinapolyakova on 15.12.2022.
//

import UIKit
import SDWebImage

class PhotoCollectionViewController: UICollectionViewController {
    
    
    let session  = Session.shared
    let service = Service()
     var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getPhoto(token: session.token) { items in
            self.items = items
            
            self.collectionView.reloadData()
        }
        }
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
            return  items.count
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPhoto", for: indexPath) as! CellCollectionViewCell
            
            let imageUrl = self.items[indexPath.row].sizes.first?.url
            
            cell.configCell(imageUrl: imageUrl)
            
            
            return cell
        }
    }
    

