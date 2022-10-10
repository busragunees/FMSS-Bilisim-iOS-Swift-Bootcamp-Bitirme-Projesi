//
//  DetailViewModel.swift
//  Travely
//
//  Created by Büşra Güneş on 7.10.2022.
//

import Foundation
import UIKit

protocol DetailViewModelProtocol:AnyObject{
    func success()
    func showRemoveBtn()
}

final class DetailViewModel {
    var travelEntity: TravelEntity? = nil
    weak var viewDelegate:DetailViewModelProtocol?
    
    func getTravelEntityById(id:String){
        StorageManager.shared.fetchDataById(entity: TravelEntity.self, id: id ) { result in
            switch result {
            case .success(let item):
                travelEntity = (item as? TravelEntity)
                if let travelEntity = self.travelEntity {
                    viewDelegate?.showRemoveBtn()
                }
                break
            case .failure(_): break
            }
        }
    }
    
    func removeItem(){
        if let travelEntity = self.travelEntity{
            StorageManager.shared.deleteBookmark(entity: travelEntity, completion: {
                self.viewDelegate?.success()
            })
        }
    }
    
    func addItem(travelItem:TravelModel?){
        if let travelItem = travelItem{
            StorageManager.shared.addBookmark(item: travelItem) { entity in
                self.viewDelegate?.success()
            }
        }
    }
    
    
}

