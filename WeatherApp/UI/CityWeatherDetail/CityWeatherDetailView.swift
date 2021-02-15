//
//  CityWeatherDetailView.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/12/21.
//

import SwiftUI

struct CityWeatherDetailView: View {
    var viewModel: CityWeatherDetailViewModel

    @ObservedObject var state: CityWeatherDetailViewModel.State

    init(viewModel: CityWeatherDetailViewModel) {
        self.viewModel = viewModel
        state = viewModel.state
    }

    var body: some View {
        VStack {
            Text(state.weatherData.tempString)
                .font(.system(size: 80))
                .padding(.top, 75)
                .padding(.bottom, 50)

            Text("Feels like: " + state.weatherData.feelsLike)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
                .font(.title)
                .padding(.bottom, 50)

            Text(state.weatherData.weather)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle)
                .padding(.bottom, 30)

            Text(state.weatherData.description)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.title)

            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(32)
    }
}

struct CityWeatherDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherDetailView(
            viewModel: CityWeatherDetailViewModel(
                state: .init(
                    weatherData: TestData.weatherData[0]
                )
            )
        )
    }
}
