//
//  JSONDecoder+WeatherApp.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

extension JSONDecoder {
    convenience init(with dateFormatter: DateFormatter) {
        self.init()
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}
