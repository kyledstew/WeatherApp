//
//  RepositoryError.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

enum RepositoryError: Error {
    case invalidData
    case noResults
    case other
}
