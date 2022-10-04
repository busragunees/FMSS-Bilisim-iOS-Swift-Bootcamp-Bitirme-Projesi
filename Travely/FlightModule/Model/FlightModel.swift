//
//  FlightModel.swift
//  Travely
//
//  Created by Büşra Güneş on 3.10.2022.
//

import Foundation

struct FlightModel:Codable{
    var id:String?
    var from:String?
    var to:String?
    var date:String?
    var images:String?
    var features:String?
    var price:Price?
}

struct Price:Codable{
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

