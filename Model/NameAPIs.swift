//
//  NameAPIs.swift
//  Ismi
//
//  Created by Osama on 7/8/20.
//  Copyright © 2020 Osama. All rights reserved.
//

import Foundation
import UIKit

class NameAPIs {
    
    // MARK: API Endpoints
    enum Endpoint {
        case genderize(String)
        case nationalize(String)
        case agify(String)
        
        var url: URL { return URL(string: self.stringValue)! }
        
        var stringValue: String {
            switch self {
                
            case .genderize(let name):
                return "https://api.genderize.io?name=\(name)"
            case .nationalize(let name):
                return "https://api.nationalize.io?name=\(name)"
            case .agify(let name):
                return "https://api.agify.io?name=\(name)"
            }
        }
    }
    
    // MARK: Asynchronous API Calls
    class func requestGenderize(name: String, completionHandler: @escaping ([String:Any]?, Error?) -> Void) {
        let endpoint = NameAPIs.Endpoint.genderize(name).url
        let task = URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            guard let data = data else { completionHandler(nil, error); return }
            
            let decoder = JSONDecoder()
            let genderData = try! decoder.decode(GenderResponse.self, from: data)
            let res = ["gender": genderData.gender, "probability": genderData.probability] as [String : Any]
            
            completionHandler(res, nil)
        }
        task.resume()
    }
    
    class func requestNationalize(name: String, completionHandler: @escaping ([String:Double]?, Error?) -> Void) {
        let endpoint = NameAPIs.Endpoint.nationalize(name).url
        let task = URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            guard let data = data else { completionHandler(nil, error); return }

            let decoder = JSONDecoder()
            let nationalityData = try! decoder.decode(NationalizeResponse.self, from: data)
            
            var res:[String:Double] = [:]
            for countryObj in nationalityData.country { res[countryObj.countryID] = countryObj.probability }
            
            completionHandler(res, nil)
        }
        task.resume()
    }
    
    class func requestAgify(name: String, completionHandler: @escaping (Int?, Error?) -> Void) {
        let endpoint = NameAPIs.Endpoint.agify(name).url
        let task = URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            guard let data = data else { completionHandler(nil, error); return }
            
            let decoder = JSONDecoder()
            let ageData = try! decoder.decode(AgifyResponse.self, from: data)
            let age = ageData.age
            
            completionHandler(age, nil)
        }
        task.resume()
    }
}
