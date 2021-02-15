//
//  DateFormatter+WeatherApp.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

extension DateFormatter {
    static let weatherServiceDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}
