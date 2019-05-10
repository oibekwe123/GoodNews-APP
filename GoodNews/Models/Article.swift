//
//  Article.swift
//  GoodNews
//
//  Created by MAC on 5/9/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

    struct ArticleList: Decodable {
        let articles: [Article]
    }

struct Article: Decodable {
    let title: String
    let description: String
}


