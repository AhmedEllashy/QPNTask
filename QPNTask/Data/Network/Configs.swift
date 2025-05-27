//
//  configs.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation

struct Configs{
    static let baseURL: String = "https://api.themoviedb.org/3"
    static let imageBaseURL: String = "https://image.tmdb.org/t/p/w500"
}
enum Method: String{
    case POST
    case GET
    case PUT
    case DELETE
}
