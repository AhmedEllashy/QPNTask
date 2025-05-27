//
//  Logger.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation

class Logger {
    static func logRequest(request: URLRequest) {
        print("Request: \(request)")
    }
    
    static func logResponse(response: URLResponse, data: Data?) {
        print(response)
        if let data = data {
            do{
                let jsonEnoder = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print("Response Body: \(jsonEnoder)")
            }catch{
                print("Json serialization Error")
            }
        }
    }
    
}

