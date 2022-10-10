//
//  BookmarksViewModel.swift
//  Travely
//
//  Created by Büşra Güneş on 10.10.2022.
//

import Foundation


protocol BookmarksViewModelProtocol:AnyObject{
    func didCellItemFetch(_ items: [TravelEntity])
}

class BookmarksViewModel {
    
    weak var viewDelegate: BookmarksViewModelProtocol?
    
    func getBookmarks(){
        StorageManager.shared.fetchData(entity: TravelEntity.self) {
            result in
            switch result {
            case .success(let list):
                let items = (list as? [TravelEntity])
                if let items = items{
                    self.viewDelegate?.didCellItemFetch(items)
                    items.forEach { item in
                        print("id:",item.id ?? "", item.title ?? "")
                    }
                }
            case .failure(_): break
            }
        }
    }
    
}


