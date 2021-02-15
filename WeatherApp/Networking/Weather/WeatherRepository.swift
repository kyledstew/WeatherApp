//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import Foundation

protocol WeatherRepository {
    func lookupWeather(
        city: String,
        units: WeatherUnits,
        completion: @escaping (Result<WeatherModel, RepositoryError>) -> Void)
}

struct DefaultWeatherRepository {
    let weatherWebservice: WeatherWebservice

    init(weatherWebservice: WeatherWebservice = DefaultWeatherWebservice()) {
        self.weatherWebservice = weatherWebservice
    }
}

extension DefaultWeatherRepository: WeatherRepository {
    func lookupWeather(
        city: String,
        units: WeatherUnits,
        completion: @escaping (Result<WeatherModel, RepositoryError>) -> Void) {
        guard !city.isEmpty else {
            completion(.failure(.invalidData))
            return
        }

        weatherWebservice.getForecast(city: city, units: units.rawValue) { result in
            switch result {
            case let .success(weatherResponse):
                switch weatherResponse.cod {
                case "200":
                    completion(.success(WeatherModel(weatherResponse)))

                case "404":
                    completion(.failure(.noResults))

                default:
                    completion(.failure(.other))

                }

            case .failure:
                completion(.failure(.other))
            }
        }
    }
}
