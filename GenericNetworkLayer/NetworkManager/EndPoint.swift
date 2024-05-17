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
    var headers: [String: String]? { get } //Projede bir Headers'a sahip değiliz
    
    
    func request() -> URLRequest
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST" //none
    case delete = "DELETE" //none
    case patch = "PATCH" //none
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
        guard var components = URLComponents(string: baseURL) else { fatalError("Components Error") }
        components.path = path
        
        guard let url = components.url else { fatalError("Components URL Errror") }
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod.rawValue
        
        return request
    }
}
