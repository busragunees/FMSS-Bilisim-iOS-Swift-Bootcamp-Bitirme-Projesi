//
//  ViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 27.09.2022.
//

import UIKit

class HomeViewConroller: UIViewController {

    @IBOutlet weak var articleCollectionView: UICollectionView!
    @IBOutlet weak var navigateHotels: UIView! {
        didSet {
            self.navigateHotels.tappable = true
        }
    }
    
    @IBOutlet weak var navigateFlights: UIView!{
        didSet {
            self.navigateFlights.tappable = true
        }
    }
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigateHotels.callback = {
            let hotelVC = self.storyboard?.instantiateViewController(withIdentifier: "hotelsIdentfy") as! HotelViewController
            self.navigationController?.pushViewController(hotelVC, animated: true)
        }
        self.navigateFlights.callback = {
            let flightVC = self.storyboard?.instantiateViewController(withIdentifier: "flightsIdentfy") as! FlightViewController
            self.navigationController?.pushViewController(flightVC, animated: true)
        }
    }
}


