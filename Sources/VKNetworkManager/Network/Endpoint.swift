//
//  Endpoint.swift
//  VKNetworkManager
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

/// Endpoint used to make request to call API
public protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}
