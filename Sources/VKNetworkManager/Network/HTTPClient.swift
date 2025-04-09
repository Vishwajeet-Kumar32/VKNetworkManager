//
//  HTTPClient.swift
//  VKNetworkManager
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import Foundation

public protocol HTTPClient {
    func sendRequest(endpoint: Endpoint) async -> Result<Data, NetworkError>
}

extension HTTPClient {
    
    /// This method is used to create request
    /// - Parameter endpoint: Used for base url, path, header and body
    /// - Returns: Return response data and error
    public func sendRequest(endpoint: Endpoint) async -> Result<Data, NetworkError> {
        let urlString = endpoint.baseUrl + endpoint.path
        guard urlString.isValidURL, let url = URL(string: urlString) else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        if let httpHeader = endpoint.header {
            request.allHTTPHeaderFields = httpHeader
        }
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        return await send(request)
    }
    
    /// This method is used to call api and handle data
    /// - Parameter request: Url request
    /// - Returns: Return response data and error
    private func send(_ request: URLRequest) async -> Result<Data, NetworkError> {
        do {
            #if DEBUG
            print("Request: \(request)")
            #endif
            
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            
            #if DEBUG
            print("Response: \(response)")
            #endif
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...205:
                return .success(data)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        }
        catch {
            return .failure(.unknown(error.localizedDescription))
        }
    }
}
