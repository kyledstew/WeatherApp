//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            CityEntryView(viewModel: CityEntryViewModel())
        }
    }
}
