//
//  SearchViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 8.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var hotelIndicatorView: UIView!
    @IBOutlet weak var flightIndicatorView: UIView!
    @IBOutlet weak var hotelFilterBtn: UIButton!
    @IBOutlet weak var flightFilterBtn: UIButton!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var emptyImageView: UIImageView!
    
    private let searchTableViewCellIdentifier = "searchTableViewCell"
    private let hotelViewModel = HotelViewModel()
    private let flightViewModel = FlightViewModel()
    private var searchList = [TravelModel]()
    private var filterList = [TravelModel]()
    private var isSelectedHotel = true
    private var timer: Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGestures()
        searchTextField.delegate = self
        hotelViewModel.viewDelegate = self
        flightViewModel.viewDelegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
        hotelViewModel.getHotels()
        flightViewModel.getFlights()
        registerTableView()
        self.emptyImageView.alpha = 0
    }
    
    private func registerTableView() {
        self.searchTableView.register(.init(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: searchTableViewCellIdentifier)
    }
    
    @IBAction func flightFilterAction(_ sender: UIButton) {
        sender.showAnimation {
            self.isSelectedHotel = false
            sender.tintColor = UIColor.systemPink
            self.hotelFilterBtn.tintColor = UIColor.lightGray
            self.flightIndicatorView.alpha = 1
            self.hotelIndicatorView.alpha = 0
            self.clearData()
        }
    }
    
    @IBAction func hotelFilterAction(_ sender: UIButton) {
        sender.showAnimation {
            self.isSelectedHotel = true
            sender.tintColor = UIColor.systemPink
            sender.imageView?.tintColor = UIColor.systemPink
            self.flightFilterBtn.tintColor = UIColor.lightGray
            self.hotelIndicatorView.alpha = 1
            self.flightIndicatorView.alpha = 0
            self.clearData()
        }
    }
    
    func clearData(){
        self.searchTextField.text = ""
        self.filterList.removeAll()
        self.searchTableView.reloadData()
    }
    func searchTravelData(){
        self.filterList.removeAll()
        let text =  self.searchTextField.text ?? ""
        if (text.count <= 2){
            self.emptyImageView.alpha = 0
            self.searchTableView.alpha = 0
            return
        }
        self.filterList = self.searchList.filter{
            item in
            if(self.isSelectedHotel){
                return item.title!.toLowercaseTr().contains(text.toLowercaseTr()) && item.type == "hotel"
            }else{
                return item.title!.toLowercaseTr().contains(text.toLowercaseTr()) && item.type == "flight"
            }
        }
        
        if(filterList.isEmpty){
            self.emptyImageView.alpha = 1
        }else{
            self.emptyImageView.alpha = 0
        }
        self.searchTableView.alpha = 1
        self.searchTableView.reloadData()
    }
    
    //MARK: - It provide dissmis to keybord on screen
    func configureGestures(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissOutSide))
        gestureRecognizer.cancelsTouchesInView = true
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func dismissOutSide(){
        self.searchTextField.endEditing(true)
    }
    
}

extension SearchViewController: HotelViewModelProtocol,FlightViewModelProtocol {
    func didCellItemFetch(_ items: [TravelModel]) {
        searchList.append(contentsOf: items)
        
        print("search list size",searchList.count)
        // hotelTableView.reloadData()
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func showError() {
        
    }
}



extension SearchViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (timer) in
            self.searchTravelData()
        })
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchTravelData()
        return true
    }
}

extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    // TableView total row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    // TableView cell value settings
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchTableViewCellIdentifier, for: indexPath) as! SearchTableViewCell
        cell.setItem(item:filterList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailsIdentfy") as! DetailViewController
        detailVC.travelItem = filterList[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
