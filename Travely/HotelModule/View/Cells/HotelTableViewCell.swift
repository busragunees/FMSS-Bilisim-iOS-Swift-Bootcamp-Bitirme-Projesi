//
//  HotelTableViewCell.swift
//  Travely
//
//  Created by Büşra Güneş on 3.10.2022.
//

import UIKit
import Kingfisher

class HotelTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelCategoryLabel: UILabel!
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var hotelDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setItem(item:TravelModel){
        if let image = item.images?.first{
            self.hotelImage.kf.setImage(with: URL(string:image))
        }
        hotelNameLabel.text = item.title
        hotelDescLabel.text = item.desc
    }
}
