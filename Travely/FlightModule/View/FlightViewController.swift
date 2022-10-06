//
//  FlightsViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 2.10.2022.
//

import UIKit

class FlightViewController: UIViewController {
    
    
    @IBOutlet weak var flightTableView: UITableView!
    private let flightCellReuseIdentifier = "flightTableViewCell"
    
    var flightList = [FlightModel]()
    private let viewModel = FlightViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flightTableView.delegate = self
        flightTableView.dataSource = self
        viewModel.viewDelegate = self
        viewModel.getFlights()
        self.flightTableView.register(.init(nibName: "FlightTableViewCell", bundle: nil), forCellReuseIdentifier: flightCellReuseIdentifier)
    }
}

extension FlightViewController: FlightViewModelProtocol {
    func didCellItemFetch(_ items: [FlightModel]) {
        flightList = items
        print("flight list ", items.count)
        print("flightlist 2", flightList.count)
        flightTableView.reloadData()
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func showError() {
        
    }
}

extension FlightViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: flightCellReuseIdentifier, for: indexPath) as! FlightTableViewCell
        cell.setItem(item:flightList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailsIdentfy") as! DetailViewController
        detailVC.flight = flightList[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
