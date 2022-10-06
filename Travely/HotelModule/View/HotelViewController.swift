//
//  HotelViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 2.10.2022.
//

import UIKit

class HotelViewController: UIViewController {
    
    @IBOutlet weak var hotelTableView: UITableView!
    private let hotelCellReuseIdentifier = "hotelTableViewCell"
    
    var hotelList = [HotelModel]()
    private let viewModel = HotelViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        viewModel.viewDelegate = self
        viewModel.getHotels()
        self.hotelTableView.register(.init(nibName: "HotelTableViewCell", bundle: nil), forCellReuseIdentifier: hotelCellReuseIdentifier)
    }
}

extension HotelViewController: HotelViewModelProtocol {
    func didCellItemFetch(_ items: [HotelModel]) {
        hotelList = items
        print("hotel list ", items.count)
        print("hotellist 2", hotelList.count)
        hotelTableView.reloadData()
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func showError() {
        
    }
}

extension HotelViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: hotelCellReuseIdentifier, for: indexPath) as! HotelTableViewCell
        cell.setItem(item:hotelList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailsIdentfy") as! DetailViewController
        detailVC.hotel = hotelList[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
