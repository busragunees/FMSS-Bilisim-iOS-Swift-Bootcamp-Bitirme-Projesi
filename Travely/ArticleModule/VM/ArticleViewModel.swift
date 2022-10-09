//
//  ArticleViewModel.swift
//  Travely
//
//  Created by Büşra Güneş on 5.10.2022.
//

import Foundation

protocol ArticleViewModelProtocol:AnyObject{
    func didCellItemFetch(_ items: [TravelModel])
    func showEmptyView()
    func hideEmptyView()
    func showError()
}

class ArticleViewModel{
    
    weak var viewDelegate:ArticleViewModelProtocol?
    
    func getArticles(){
        NetworkManager.instance.getArticles { items in
            print("get articles")
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
