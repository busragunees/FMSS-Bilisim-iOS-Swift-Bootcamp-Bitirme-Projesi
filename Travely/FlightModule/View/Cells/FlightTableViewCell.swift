//
//  FlightTableViewCell.swift
//  Travely
//
//  Created by Büşra Güneş on 3.10.2022.
//

import UIKit
import Kingfisher

class FlightTableViewCell: UITableViewCell {
    @IBOutlet weak var flightCategoryLabel: UILabel!
    @IBOutlet weak var flightImage: UIImageView!
    @IBOutlet weak var flightNameLabel: UILabel!
    @IBOutlet weak var flightDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setItem(item:TravelModel){
        if let image = item.images?.first{
            self.flightImage.kf.setImage(with: URL(string:image))
        }
        if let title = item.title{
        flightNameLabel.text = title
        }
        if let date = item.date{
            flightDescLabel.text = date + " " + (item.price?.priceWithCurrency ?? "")
        }
       
    }
}

