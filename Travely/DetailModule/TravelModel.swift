//
//  TravelModel.swift
//  Travely
//
//  Created by Büşra Güneş on 9.10.2022.
//

import Foundation

struct TravelModel:Codable {
    var id:String?
    var title: String?
    var desc: String?
    var category:String?
    var type: String?
    var images:[String]?
    var date: String?
    var features:[String]?
    var location:Location?
    var price:Price?
}

struct Location:Codable {
    var lat:Double?
    var lng:Double?
}

struct Price:Codable {
    var price:String?
    var currency:String?
    var priceWithCurrency:String{
        get{
            if let price = price, let currency = currency{
                return String(price + currency)
            }else{
                return ""
            }
        }
    }
}

/*
 extension ToDo {
     var toDTO: ToDoDTO {
         ToDoDTO(userId: userId,
                 id: id,
                 title: title,
                 completed: isCompleted)
     }
 }
 */

extension TravelEntity {
    var toModel: TravelModel{
        TravelModel(id: id,
                    title: title,
                    desc: desc,
                    category: category,
                    type: type,
                    images: images,
                    date: date,
                    features: features
        )
    }
}

/*
 var id:String?
 var title: String?
 var desc: String?
 var category:String?
 var type: String?
 var images:[String]?
 var date: String?
 var features:[String]?
 var location:Location?
 var price:Price?
 */
