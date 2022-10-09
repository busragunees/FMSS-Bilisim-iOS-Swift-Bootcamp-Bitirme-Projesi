//
//  BookmarksViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 6.10.2022.
//

import UIKit

class BookmarksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    override func viewDidAppear(_ animated: Bool) {
        getBookmarks()
    }
    
    func getBookmarks(){
        StorageManager.shared.fetchData(entity: TravelEntity.self) {
            result in
            switch result {
            case .success(let list):
                let items = (list as? [TravelEntity])
                if let items = items{
                    items.forEach { item in
                        print("id:",item.id ?? "", item.title ?? "")
                    }
                }
            case .failure(_): break
                
            }
        }
    }
    

}
