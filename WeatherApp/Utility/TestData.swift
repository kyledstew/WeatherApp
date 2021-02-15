//
//  TestData.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/12/21.
//

import Foundation

struct TestData {
    static var weatherData: [WeatherModel.WeatherData] {
        [
            .init(
                dateString: Date().userFriendly,
                description: "Cloudy",
                tempString: "59",
                feelsLike: "62",
                weather: "Light Clouds"
            ),
            .init(
                dateString: Date(timeIntervalSinceNow: -60 * 60 * 2).userFriendly,
                description: "Sunny",
                tempString: "90",
                feelsLike: "99",
                weather: "Sunny"
            )
        ]
    }
}
