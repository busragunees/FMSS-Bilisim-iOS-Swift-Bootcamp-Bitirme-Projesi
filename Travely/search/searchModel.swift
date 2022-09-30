//
//  searchModel.swift
//  Travely
//
//  Created by Büşra Güneş on 30.09.2022.
//

import UIKit

class searchModel:NSObject{
    var imageName:String
    var imageTitle:String
    var imageDesc:String
    var imageCategory:String
    
    init(imageName: String, imageTitle: String, imageDesc: String, imageCategory: String) {
        self.imageName = imageName
        self.imageTitle = imageTitle
        self.imageDesc = imageDesc
        self.imageCategory = imageCategory
    }
    
    class func generateModelArray() -> [searchModel]{
        var modelAry = [searchModel]()
        
        modelAry.append(searchModel(imageName: "img0", imageTitle: "Marina Bay", imageDesc: "Singapore", imageCategory:"Hotel"))
        
        return modelAry
    }
}
