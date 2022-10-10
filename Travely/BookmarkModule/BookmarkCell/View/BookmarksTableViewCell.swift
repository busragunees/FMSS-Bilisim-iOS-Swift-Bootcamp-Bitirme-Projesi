//
//  BookmarksTableViewCell.swift
//  Travely
//
//  Created by Büşra Güneş on 9.10.2022.
//

import UIKit

class BookmarksTableViewCell: UITableViewCell {
    @IBOutlet weak var bookmarksCategory: UILabel!
    @IBOutlet weak var bookmarksImage: UIImageView!
    @IBOutlet weak var bookmarksTitle: UILabel!
    @IBOutlet weak var bookmarksDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setItem(item:TravelEntity){
        if let image = item.images?.first{
            self.bookmarksImage.kf.setImage(with: URL(string:image ))
        }
        if let title = item.title{
        bookmarksTitle.text = title
        }
        if let date = item.date{
            bookmarksDesc.text = date
        }
       
    }
    
}
