//
//  CityWeatherRow.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/12/21.
//

import SwiftUI

struct CityWeatherRow: View {
    let weatherData: WeatherModel.WeatherData

    var body: some View {
        HStack {
            Text(weatherData.description)

            Spacer()

            Text("Temp: " + weatherData.tempString)
        }
        .padding(32)
    }
}

struct CityWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CityWeatherRow(
                weatherData: TestData.weatherData[0]
            )
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
