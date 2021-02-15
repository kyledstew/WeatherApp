//
//  CityWeatherDetailViewModel.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/12/21.
//

import SwiftUI

class CityWeatherDetailViewModel {
    var state: State

    init(state: State) {
        self.state = state
    }
}

// MARK: - ViewModel Event and State
extension CityWeatherDetailViewModel {
    enum Event {

    }

    class State: ObservableObject {
        var weatherData: WeatherModel.WeatherData

        init(weatherData: WeatherModel.WeatherData) {
            self.weatherData = weatherData
        }
    }
}

// MARK: - Conform to ViewModel Protocol
extension CityWeatherDetailViewModel: ViewModel {
    func notify(event: Event) {

    }
}
