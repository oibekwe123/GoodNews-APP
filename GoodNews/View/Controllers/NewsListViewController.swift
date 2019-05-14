//
//  NewsListViewController.swift
//  GoodNews
//
//  Created by MAC on 5/13/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import UIKit

protocol NewsListProtocol {
    func Update()
}


class NewsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // created a variable newViewModel with a protocol of NewViewModelProtocol with force unwrapping
    var newViewModel:NewsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loaded the variable newViewModel with the ViewModel class
        //Loaded the variable newViewModel with the protocol function fetchArticles
        newViewModel = NewsViewModel(newsViewCtrl: self)
        newViewModel.fetchArticles()
        
        
    }
    
}


// MARK: Extension of NewsListViewController conforms to UITableViewDataSource
extension NewsListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newViewModel.NumberofRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        cell.textLabel?.text = newViewModel.getArticleTitle(for: indexPath.row)
        cell.detailTextLabel?.text = newViewModel.getArticleDesc(for: indexPath.row)
        return cell
    }
    
    
}

extension NewsListViewController: NewsListProtocol {
    func Update() {
        tableView.reloadData()
    }
    
    
}

