//
//  CityWeatherView.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import SwiftUI

struct CityWeatherView: View {
    var viewModel: CityWeatherViewModel

    @ObservedObject var state: CityWeatherViewModel.State

    init(viewModel: CityWeatherViewModel) {
        self.viewModel = viewModel
        state = viewModel.state
    }

    var body: some View {
        List(self.state.weatherModel?.weatherData ?? []) { weatherData in
            NavigationLink(destination: CityWeatherDetailView(
                viewModel: CityWeatherDetailViewModel(
                    state: CityWeatherDetailViewModel.State(
                        weatherData: weatherData
                    )
                )
            )
            ) { CityWeatherRow(weatherData: weatherData) }
        }
        .navigationTitle(state.weatherModel?.cityName ?? "")
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView(
            viewModel: CityWeatherViewModel(
                state: .init(
                    weatherModel: .constant(
                        WeatherModel(cityName: "Portland", weatherData: TestData.weatherData)
                    )
                )
            )
        )
    }
}
