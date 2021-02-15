//
//  URL+WeatherApp.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

extension URL {
    func attachingParameters(_ parameters: [String: Any]) -> URL {
        guard !parameters.isEmpty else { return self}
        let path = self.absoluteString + "?" + parameters.compactMap { "\($0.key)=\("\($0.value)".addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)" }.joined(separator: "&")
        return URL(string: path)!
    }
}
