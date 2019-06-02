//
//  WebService.swift
//  GoodNews
//
//  Created by MAC on 5/9/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

class WebService {

    func getArticles(url: String, completion: @escaping ([Article]?) -> ()) {
        
        // declared a constant url with a string and type url!
        let url = URL(string:url)!
        
        URLSession.shared.dataTask(with: url) { data, response , error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                
                print(articleList?.articles)
            }
            
            
            }.resume()
    }
    

}
    

    
    


