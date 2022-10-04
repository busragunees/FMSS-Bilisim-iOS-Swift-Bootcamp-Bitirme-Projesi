//
//  HotelModel.swift
//  Travely
//
//  Created by Büşra Güneş on 2.10.2022.
//

import Foundation

struct HotelModel:Codable{
    var id:String?
    var name:String?
    var desc:String?
    var images:[String]?
    var features:[String]?
    var location:Location?
}

struct Location:Codable{
    var lat:Double?
    var lng:Double?
}











