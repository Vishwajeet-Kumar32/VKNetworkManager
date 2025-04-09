//
//  NetworkError.swift
//  VKNetworkManager
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

/// Network error
public enum NetworkError: Error {
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown(String)
}
