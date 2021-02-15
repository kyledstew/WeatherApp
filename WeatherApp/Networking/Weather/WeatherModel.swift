//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let weatherData: [WeatherData]

    struct WeatherData: Identifiable {
        let id: String = UUID().uuidString
        let dateString: String
        let description: String
        let tempString: String
        let feelsLike: String
        let weather: String
    }
}

extension WeatherModel {
    init(_ weatherResponse: WeatherResponse) {
        self.cityName = weatherResponse.city.name
        self.weatherData = weatherResponse.list.map { WeatherData($0) }
    }
}

extension WeatherModel.WeatherData {
    init(_ response: WeatherResponse.WeatherResponseData) {
        self.dateString = response.date.userFriendly
        self.tempString = "\(Int(response.main.temp))"
        self.description = (response.weather.first?.description ?? "").capitalized
        self.feelsLike = "\(Int(response.main.feels_like))"
        self.weather = response.weather.first?.main ?? ""
    }
}
