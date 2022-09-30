//
//  ViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var articleCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleCollectionView.delegate = self
        articleCollectionView.dataSource = self
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = articleCollectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! ArticleCollectionViewCell
       
        return cell
    }
}
