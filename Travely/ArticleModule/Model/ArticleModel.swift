//
//  ArticleModel.swift
//  Travely
//
//  Created by Büşra Güneş on 5.10.2022.
//

import Foundation

struct ArticleModel:Codable{
    var id:String?
    var title:String?
    var description:String?
    var category:String?
    var images:[String]?
    //var sourceUrl:URL?
}
