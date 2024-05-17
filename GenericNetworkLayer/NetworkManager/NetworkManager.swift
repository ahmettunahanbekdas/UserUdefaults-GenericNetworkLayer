//
//  NetworkManager.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation


protocol NetworkManagerDelegate {
    func request <T: Codable> (_ endPoint: EndPoint, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class NetworkManager: NetworkManagerDelegate {
    
    private init() {}
    static let shared = NetworkManager()
    
    let jsonDecoder = JSONDecoder()
    
    func request<T: Codable>(_ endPoint: EndPoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: endPoint.request()) { [weak self] data, response, error in
            //MARK: SELF
            guard let self = self else {
                completion(.failure(.selfError))
                return
            }
            //MARK: ERROR
            guard error == nil else {
                completion(.failure(.unknownError))
                return
            }
            //MARK: RESPONSE
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.responseError))
                return
            }
            let handleResponse = handleNetworkRequest(response: response)
            switch handleResponse {
            case .success(let callbackResponse):
                print(callbackResponse)
            case .failure(_):
                completion(.failure(.responseError))
            }
            //MARK: DATA
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            do {
                let jsonData = try jsonDecoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }catch {
                completion(.failure(.dataError))
            }
        }
        task.resume()
    }
    
    private func handleNetworkRequest(response: HTTPURLResponse) -> Result<String, NetworkError> {
        switch response.statusCode {
           case 200...299:
                .success("Response Success")
           case 400:
                .failure(.badRequest)
           case 401:
                .failure(.unauthorized)
           case 404:
                .failure(.notFound)
           case 500...599:
                .failure(.serverError)
           default:
                .failure(.unknownError)
           }
    }
    
    
}
