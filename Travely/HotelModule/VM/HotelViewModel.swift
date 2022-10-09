//
//  HotelViewModel.swift
//  Travely
//
//  Created by Büşra Güneş on 2.10.2022.
//

import Foundation

protocol HotelViewModelProtocol:AnyObject{
    func didCellItemFetch(_ items: [TravelModel])
    func showEmptyView()
    func hideEmptyView()
    func showError()
}

class HotelViewModel{
    
    weak var viewDelegate:HotelViewModelProtocol?
    
    func getHotels(){
        NetworkManager.instance.getHotels { items in
            print("get hotels")
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
