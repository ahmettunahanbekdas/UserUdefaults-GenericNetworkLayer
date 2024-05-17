//
//  NetworkError.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

enum NetworkError: Error {
    case selfError
    case unknownError
    case responseError
    case badRequest
    case unauthorized
    case serverError
    case notFound
    case dataError
}
