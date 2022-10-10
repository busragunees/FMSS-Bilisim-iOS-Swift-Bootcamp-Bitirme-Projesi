//
//  BookmarksViewController.swift
//  Travely
//
//  Created by Büşra Güneş on 6.10.2022.
//

import UIKit

class BookmarksViewController: UIViewController {
    @IBOutlet weak var bookmarksTableView: UITableView!
    private let bookmarksCellReuseIdentifier = "bookmarksTableViewCell"
    private var bookmarksList = [TravelEntity]()
    private let viewModel = BookmarksViewModel()
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // For tableView delegate and register settings
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.getBookmarks()
    }
    
    // For tableView delegate and register func
    func setupUI() {
        bookmarksTableView.delegate = self
        bookmarksTableView.dataSource = self
        viewModel.viewDelegate = self
        registerTableView()
    }
    
    // TableView register func
    private func registerTableView() {
        self.bookmarksTableView.register(.init(nibName: "BookmarksTableViewCell", bundle: nil), forCellReuseIdentifier: bookmarksCellReuseIdentifier)
    }
    

}

extension BookmarksViewController:BookmarksViewModelProtocol{
    func didCellItemFetch(_ items: [TravelEntity]) {
        bookmarksList = items
        bookmarksTableView.reloadData()
    }
}
extension BookmarksViewController:UITableViewDelegate,UITableViewDataSource{
    // TableView total row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarksList.count
    }
    // TableView cell value settings
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bookmarksCellReuseIdentifier, for: indexPath) as! BookmarksTableViewCell
        cell.setItem(item:bookmarksList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailsIdentfy") as! DetailViewController
        detailVC.travelItem = bookmarksList[indexPath.row].toModel
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }

 
}

