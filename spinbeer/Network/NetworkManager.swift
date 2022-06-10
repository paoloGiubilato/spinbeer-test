//
//  NetworkManager.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import Foundation

protocol NetworkProvider {
    func request<Request: Requestable>(request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

class NetworkManager: NetworkProvider {
    
    func request<Request: Requestable>(request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: request.url) else {
            completion(.failure(NetworkError.genericError))
            return
        }
        
        var queryParams: [URLQueryItem] = []
        request.queryParams.forEach {
            let queryParam = URLQueryItem(name: $0.key, value: $0.value)
            urlComponents.queryItems?.append(queryParam)
            queryParams.append(queryParam)
        }
        
        urlComponents.queryItems = queryParams
        
        guard let url = urlComponents.url else {
            completion(.failure(NetworkError.networkError))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard response != nil, let data = data else {
                completion(.failure(NetworkError.mappingError))
                return
            }
            
            do {
                let responseObject = try request.decode(responseData: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
}
