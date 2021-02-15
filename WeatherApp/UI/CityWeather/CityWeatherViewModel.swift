//
//  CityWeatherViewModel.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import SwiftUI

class CityWeatherViewModel {
    var state: State

    init(state: State) {
        self.state = state
    }
}

// MARK: - ViewModel Event and State
extension CityWeatherViewModel {
    enum Event {}

    class State: ObservableObject {
        @Binding var weatherModel: WeatherModel?

        init(weatherModel: Binding<WeatherModel?>) {
            self._weatherModel = weatherModel
        }
    }
}

// MARK: - Conform to ViewModel Protocol
extension CityWeatherViewModel: ViewModel {
    func notify(event: Event) {}
}

