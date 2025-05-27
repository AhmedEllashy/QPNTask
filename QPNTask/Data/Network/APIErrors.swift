//
//  NetworkError.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//


import Foundation

enum APIErrors: Error {
    case badURL
    case requestFailed
    case badResponse
    case decodingError
    case unauthorized
    case serverError
    case unknown
    case httpError(_ statusCode: Int)
}
