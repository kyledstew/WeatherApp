//
//  WeatherWebservice.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

protocol WeatherWebservice {
    func getForecast(city: String, units: String, completion: @escaping (Result<WeatherResponse, ServiceError>) -> Void)
}

struct DefaultWeatherWebservice {
    let webserviceProvider: WebserviceProvider

    init(webserviceProvider: WebserviceProvider = DefaultWebserviceProvider()) {
        self.webserviceProvider = webserviceProvider
    }

    enum NetworkConstants {
        static let apiKey: String = "65d00499677e59496ca2f318eb68c049"
        static let url: URL = URL(string: "https://api.openweathermap.org/data/2.5/forecast")!
    }
}

extension DefaultWeatherWebservice: WeatherWebservice {
    func getForecast(city: String, units: String, completion: @escaping (Result<WeatherResponse, ServiceError>) -> Void) {
        let parameters: [String: String] = [
            "q": city,
            "units": units,
            "appid": NetworkConstants.apiKey
        ]

        let url = NetworkConstants.url.attachingParameters(parameters)
        let request = URLRequest(url: url)
        webserviceProvider.perform(
            request,
            successObject: WeatherResponse.self,
            jsonDecoder: JSONDecoder(with: .weatherServiceDateFormatter),
            completion: completion)
    }
}

