//
//  NewViewModel.swift
//  GoodNews
//
//  Created by MAC on 5/13/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

//Protocol and created a fucntion fetchArticles
protocol NewsViewModelProtocol {
    func fetchArticles()
    func NumberofRows()-> Int
    func getArticleTitle(for row: Int) -> String
    func getArticleDesc(for row: Int) -> String
    
}

// Class of NewsViewModel
class NewsViewModel {
    var articles: [Article]? {
        didSet {
            DispatchQueue.main.async {
                self.newsViewCtrl.Update()
            }
            
        }
    }


     var newsViewCtrl:NewsListViewController!
    init(newsViewCtrl:NewsListProtocol) {
        self.newsViewCtrl = newsViewCtrl as? NewsListViewController
    }
    
}

    


// Extension of NewViewModels Class that conforms to a protocol of NewViewModelProtocol
extension NewsViewModel:NewsViewModelProtocol {
    func NumberofRows() -> Int {
        return self.articles?.count ?? 0
    }
    
    func getArticleTitle(for row: Int) -> String {
        return self.articles?[row].title ?? ""
    }
    
    func getArticleDesc(for row: Int) -> String {
        return self.articles?[row].description ?? ""
    }
    
    func fetchArticles() {
       
        // used a weak self inside a closure in order to avoid memory leaks
        WebService().getArticles(url: ConstanturlFile.urlString) { [weak self] articles in
            self?.articles = articles
            
            
            
        }
    }
    
    
}
