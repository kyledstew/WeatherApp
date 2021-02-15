//
//  CityEntryViewModel.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import SwiftUI

class CityEntryViewModel {
    var state: State
    var weatherRepository: WeatherRepository

    init(state: State = State(), weatherRepository: WeatherRepository = DefaultWeatherRepository()) {
        self.state = state
        self.weatherRepository = weatherRepository
    }
}

// MARK: - ViewModel Event and State
extension CityEntryViewModel {
    enum Event {
        case lookup
    }

    class State: ObservableObject {
        // MARK: - Published Varibles
        @Published var enteredText: String = ""
        @Published var resultsLoaded: Bool = false
        @Published var weatherModel: WeatherModel?
    }
}

// MARK: - Conform to ViewModel Protocol
extension CityEntryViewModel: ViewModel {
    func notify(event: Event) {
        switch event {
        case .lookup:
            weatherRepository.lookupWeather(city: state.enteredText, units: .imperial) { result in
                switch result {
                case let .success(weatherModel):
                    DispatchQueue.main.async {
                        self.state.weatherModel = weatherModel
                        self.state.resultsLoaded = true
                    }

                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}
