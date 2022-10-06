//
//  DetailViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 6.10.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var detailButtton: UIButton!
    
    var article:ArticleModel! = nil
    var hotel:HotelModel! = nil
    var flight:FlightModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.clipsToBounds = true
        image.layer.cornerRadius = 44
        image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        if let article = article{
            setArticle(item:article)
            
        }
        if let hotel = hotel{
            setHotel(item:hotel)
        }
        if let flight = flight{
            setFlight(item:flight)
        }
    }
    
    //MARK: - Set items functions on DetailViewController
    func setArticle(item:ArticleModel){
        if let image = item.images?.first{
            self.image.kf.setImage(with: URL(string:image))
        }
        categoryLabel.text = item.category
        titleLabel.text = item.title
        descLabel.text = item.description
    }
    func setHotel(item:HotelModel){
        if let image = item.images?.first{
            self.image.kf.setImage(with: URL(string:image))
        }
        categoryLabel.text = item.features?.first
        titleLabel.text = item.name
        descLabel.text = item.desc
    }
    func setFlight(item:FlightModel){
        if let image = item.images{
            self.image.kf.setImage(with: URL(string:image))
        }
        categoryLabel.text = item.features
        titleLabel.text = (item.to ?? "") + "→" + (item.from ?? "")
        //desc metni nasıl olsun??
    }
}
