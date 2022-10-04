//
//  NetworkManager.swift
//  Travely
//
//  Created by Büşra Güneş on 2.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let instance = NetworkManager()
    
    let headers : HTTPHeaders = [
        "Accept": "*/*",
        "User-Agent": "Mozilla/5.0 (compatible; Rigor/1.0.0; http://rigor.com)"
    ]
    //Alamofire generic olarak fetch edilir.
    public func fetch<T:Codable> (_ method: HTTPMethod, url: String, requestModel: T?, model: T.Type, completion: @escaping (AFResult<Codable>) -> Void)
    {
        AF.request(
            url,
            method: method,
            parameters: NetworkManager.toParameters(model: requestModel),
            encoding: JSONEncoding.default,
            headers: headers
        )
        .responseData{ response in
            
            switch response.result {
            case .success(let value):
                do{
                    let responseJsonData = JSON(value)
                    let responseModel = try JSONDecoder().decode(model.self, from: responseJsonData.rawData())
                    completion(.success(responseModel))
                }
                catch let parsingError{
                    print("Success (error): \(parsingError)")
                }
                
            case .failure(let error):
                print("Failure: \(error)")
                completion(.failure(error))
                
            default: fatalError("Fatal error.")
                
            }
        }
    }
    
    static func toParameters<T:Encodable>(model: T?) -> [String:AnyObject]?
    {
        if(model == nil)
        {
            return nil
        }
        
        let jsonData = modelToJson(model:model)
        let parameters = jsonToParameters(from: jsonData!)
        return parameters! as [String: AnyObject]
    }
    
    static func modelToJson<T:Encodable>(model:T)  -> Data?
    {
        return try! JSONEncoder().encode(model.self)
    }
    
    static func jsonToParameters(from data: Data) -> [String: Any]?
    {
        return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    }
    
    public func getHotels(complition: @escaping ([HotelModel]?) -> Void,fail:  @escaping()-> Void){
        NetworkManager.instance.fetch(HTTPMethod.get, url: "https://busra-travely-api.herokuapp.com/hotels" , requestModel: nil, model:[HotelModel].self ) { response in
            switch(response)
            {
            case .success(let model):
                let hotelModel = model as! [HotelModel]
                complition(hotelModel)
            case .failure(_):
                fail()
                break
            }
        }
    }
    
    public func getFlights(complition: @escaping ([FlightModel]?) -> Void,fail:  @escaping()-> Void){
        NetworkManager.instance.fetch(HTTPMethod.get, url: "https://busra-travely-api.herokuapp.com/flights" , requestModel: nil, model:[FlightModel].self ) { response in
            switch(response)
            {
            case .success(let model):
                let flightModel = model as! [FlightModel]
                complition(flightModel)
            case .failure(_):
                fail()
                break
            }
        }
    }
}






