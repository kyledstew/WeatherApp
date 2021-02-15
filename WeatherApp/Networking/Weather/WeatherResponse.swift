//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let cod: String
    let list: [WeatherResponseData]
    let city: City

    struct City: Decodable {
        let name: String
    }
}

extension WeatherResponse {
    struct WeatherResponseData: Decodable {
        let main: Main
        let weather: [Weather]
        let clouds: Clouds
        let wind: Wind
        let date: Date

        enum CodingKeys: String, CodingKey {
            case main, weather, clouds, wind
            case date = "dt_txt"
        }

        struct Main: Decodable {
            let temp: Float
            let feels_like: Float
            let temp_min: Float
            let temp_max: Float
            let pressure: Int
            let sea_level: Int
            let grnd_level: Int
            let humidity: Int
            let temp_kf: Float
        }

        struct Weather: Decodable {
            let id: Int
            let main: String
            let description: String
            let icon: String
        }

        struct Clouds: Decodable {
            let all: Int
        }

        struct Wind: Decodable {
            let speed: Float
            let deg: Int
        }
    }
}
