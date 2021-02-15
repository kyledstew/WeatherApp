//
//  WebserviceProvider.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

protocol WebserviceProvider {
    func perform<T>(
        _ request: URLRequest,
        successObject: T.Type,
        jsonDecoder: JSONDecoder,
        completion: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable
}

class DefaultWebserviceProvider: WebserviceProvider {
    var dataTask: URLSessionDataTask?

    /// Performs a network request 
    func perform<T>(
        _ request: URLRequest,
        successObject: T.Type,
        jsonDecoder: JSONDecoder = JSONDecoder(),
        completion: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
        dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.serviceError(error)))
            } else if let data = data {
                do {
                    let parsedData = try jsonDecoder.decode(T.self, from: data)
                    completion(.success(parsedData))
                } catch {
                    completion(.failure(.parseError(error)))
                }
            } else {
                completion(.failure(.noData))
            }
        }

        dataTask?.resume()
    }
}
