//
//  SearchTableViewCell.swift
//  Travely
//
//  Created by Büşra Güneş on 10.10.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var searchCategoryLabel: UILabel!
    @IBOutlet weak var searchDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setItem(item:TravelModel){
        if let image = item.images?.first{
            self.searchImageView.kf.setImage(with: URL(string:image ))
        }
        if let title = item.title{
            searchTitleLabel.text = title
        }
        if let date = item.date{
            searchDescLabel.text = date
        }
       
    }
    
}
