
//  Services.swift
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

enum URLStrings: String {
    case getTodoList = "http://starlord.hackerearth.com/gotjson"
}

protocol DataSerializationProtocol {
    static func serializeData(data: Data) -> [[String:AnyObject]]
}

class APIHandler {
    static let sharedInstance = APIHandler()
    func getData(completion: @escaping (NSArray)->()){
        if let getURL = URL(string: URLStrings.getTodoList.rawValue) {
            URLSession.shared.dataTask(with: getURL, completionHandler: {(data, response, error) in
                if let responseData = data {
                    let value = DataSerializationHandler.serializeData(data: responseData) as NSArray
                    completion(value)
                }
            }).resume()
        }
    }
}

class DataSerializationHandler: DataSerializationProtocol {
    static func serializeData(data: Data) -> [[String:AnyObject]]
    {
        if let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [[String:AnyObject]] {
            if let dataArray = jsonData {
                return dataArray
            }
        }
        return []
    }
}
