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
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    
    var travelItem: TravelModel! = nil
    private let viewModel = DetailViewModel()

    // weak var viewModel: DetailViewModel?
    
    
    @IBAction func removeBtn(_ sender: UIButton) {
        sender.showAnimation {
            self.viewModel.removeItem()
        }
    }
    @IBAction func saveBtn(_ sender: UIButton) {
        sender.showAnimation {
            self.viewModel.addItem(travelItem: self.travelItem)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        image.clipsToBounds = true
        image.layer.cornerRadius = 44
        image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        //MARK: - for show value on detail screen.
        if let travelItem = travelItem {
            setItem(item: travelItem)
            self.viewModel.getTravelEntityById(id: travelItem.id ?? "0")
        }
        
    }
    

    //MARK: - Set items functions on DetailViewController
    func setItem(item:TravelModel){
        if let image = item.images?.first{
            self.image.kf.setImage(with: URL(string:image))
        }
        categoryLabel.text = item.category
        titleLabel.text = item.title
        descLabel.text = item.desc
    }
    /*func setHotel(item:HotelModel){
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
     descLabel.text = (item.date ?? "") + " tarilerinde uçuşumuz bulunmaktadır."
     }*/
}

extension DetailViewController: DetailViewModelProtocol{
    func success() {
        self.navigationController?.popViewController(animated:true)
    }
}

