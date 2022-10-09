//
//  FlightViewModel.swift
//  Travely
//
//  Created by Büşra Güneş on 3.10.2022.
//

import Foundation

protocol FlightViewModelProtocol:AnyObject{
    func didCellItemFetch(_ items: [TravelModel])
    func showEmptyView()
    func hideEmptyView()
    func showError()
}

class FlightViewModel{
    
    weak var viewDelegate:FlightViewModelProtocol?
    
    func getFlights(){
        NetworkManager.instance.getFlights{ items in
            print("get flights")
            if (items?.isEmpty==false)
            {
                self.viewDelegate?.hideEmptyView()
                self.viewDelegate?.didCellItemFetch(items!)
            }
        
            //veriyi listeye ekle
        } fail: {
            self.viewDelegate?.showEmptyView()
            self.viewDelegate?.showError()
        }
    }
    
}
