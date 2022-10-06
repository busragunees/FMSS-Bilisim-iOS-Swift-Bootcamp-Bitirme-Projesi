//
//  ViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 27.09.2022.
//

import UIKit

class HomeViewConroller: UIViewController{

    
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
    private let articleCellReuseIdentifier = "articleCollectionViewCell"
    var articleList = [ArticleModel]()
    private let viewModel = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleCollectionView.delegate = self
        articleCollectionView.dataSource = self
        viewModel.viewDelegate = self
        viewModel.getArticles()
        self.articleCollectionView.register(.init(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: articleCellReuseIdentifier)
        
//for selected cells.
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

extension HomeViewConroller: ArticleViewModelProtocol {
    func didCellItemFetch(_ items: [ArticleModel]) {
        articleList = items
        print("article list ", items.count)
        print("article 2", articleList.count)
        articleCollectionView.reloadData()
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func showError() {
        
    }
}


extension HomeViewConroller:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: articleCellReuseIdentifier, for: indexPath) as! ArticleCollectionViewCell
        cell.setItem(item: articleList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailsIdentfy") as! DetailViewController
        detailVC.article = articleList[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

