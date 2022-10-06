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

    func setItem(item:FlightModel){
        if let image = item.images{
            self.flightImage.kf.setImage(with: URL(string:image))
        }
        if let to = item.to, let from = item.from{
        flightNameLabel.text = to + " → " + from
        }
        if let date = item.date{
            flightDescLabel.text = date + " " + (item.price?.priceWithCurrency ?? "")
        }
       
    }
}

