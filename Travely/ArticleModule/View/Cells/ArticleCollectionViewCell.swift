//
//  ArticleCollectionViewCell.swift
//  Travely
//
//  Created by Büşra Güneş on 29.09.2022.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var saveIconView: UIView!
    @IBOutlet weak var saveIcon: UIImageView!
    @IBOutlet weak var articleCellCategory: UILabel!
    @IBOutlet weak var articleCellImage: UIImageView!
    @IBOutlet weak var articleCellTitle: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setItem(item:TravelModel){
        if let image = item.images?.first{
            self.articleCellImage.kf.setImage(with: URL(string:image))
        }
        articleCellCategory.text = item.category
        articleCellTitle.text = item.title

    }
    
    
    
}
