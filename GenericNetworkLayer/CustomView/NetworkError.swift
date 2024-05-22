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

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .selfError:
            return "An internal error occurred."
        case .unknownError:
            return "An unknown error occurred."
        case .responseError:
            return "There was an error with the response."
        case .badRequest:
            return "The request was invalid or cannot be otherwise served."
        case .unauthorized:
            return "The request requires user authentication."
        case .serverError:
            return "An error occurred on the server."
        case .notFound:
            return "The requested resource could not be found."
        case .dataError:
            return "There was an error with the data."
        }
    }
}

