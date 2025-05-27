//
//  APIClient.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import Foundation


final class APIClient{
    func request<T: Decodable>(
        url: String,
        method: Method = .GET,
        headers: [String: String]? = nil,
        parameters: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T {
        var urlString = url
        
        if let parameters = parameters {
            var urlComponents = URLComponents(string: urlString)
            
            urlComponents?.queryItems = parameters.map{ URLQueryItem(name: $0.key, value: $0.value) }
            
            if let finalURL = urlComponents?.url {
                urlString = finalURL.absoluteString
            }
        }
        
        guard let url = URL(string: urlString) else {
            throw APIErrors.badURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("Bearer \(AppConstants.accessToken)", forHTTPHeaderField: "Authorization")

        if let headers{
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        if let body = body, (method == .POST || method == .PUT || method == .DELETE) {
            urlRequest.httpBody = body
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        Logger.logResponse(response: response, data: data)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIErrors.badResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIErrors.httpError(httpResponse.statusCode)
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw APIErrors.decodingError
          
        }
    }
}
