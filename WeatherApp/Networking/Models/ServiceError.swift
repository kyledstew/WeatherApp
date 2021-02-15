//
//  ServiceError.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

enum ServiceError: Error {
    case noData
    case parseError(Error)
    case serviceError(Error)
}
