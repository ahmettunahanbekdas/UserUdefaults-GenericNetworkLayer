//
//  EndPoint.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

// https://rickandmortyapi.com/api

protocol EndPointDelegate {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethods { get }
    var headers: [String: String]? { get }
    
    func request() -> URLRequest
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH" 
}

enum EndPoint {
    case getCharacter(page: Int)
    case detailToCharacter(id: Int)
}

extension EndPoint: EndPointDelegate {
    
    var baseURL: String {
        return "https://rickandmortyapi.com/api"
    }
    
    var path: String {
        switch self {
        case .getCharacter(page: let page):
            return "/character/?page=\(page)"
        case .detailToCharacter(id: let id):
            return "/character/\(id)"
        }
    }
    
    var httpMethod: HTTPMethods {
        switch self {
        case .getCharacter(_):
            return .get
        case .detailToCharacter(_):
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard let components = URLComponents(string: baseURL + path) else { fatalError("Components Error") }
        guard let url = components.url else { fatalError("Components URL Error") }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        return request
    }
}
