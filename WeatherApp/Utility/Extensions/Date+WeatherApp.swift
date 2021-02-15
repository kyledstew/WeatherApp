//
//  Date+WeatherApp.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/12/21.
//

import Foundation

extension Date {
    var userFriendly: String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "MMM dd, h:mm a"
        return formatter.string(from: self)
    }
}
