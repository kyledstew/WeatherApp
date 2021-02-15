//
//  CityEntryView.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import SwiftUI

struct CityEntryView: View {
    var viewModel: CityEntryViewModel

    @ObservedObject var state: CityEntryViewModel.State

    init(viewModel: CityEntryViewModel) {
        self.viewModel = viewModel
        state = viewModel.state
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                TextField("City Name", text: $state.enteredText)
                    .multilineTextAlignment(.center)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )

                Divider()

                Button("Lookup") {
                    self.viewModel.notify(event: .lookup)
                }
                .foregroundColor(Color.black)
                .frame(width: 200)
                .frame(height: 75)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.black, lineWidth: 1)
                )

                NavigationLink(
                    destination: CityWeatherView(
                        viewModel: CityWeatherViewModel(
                            state: CityWeatherViewModel.State(
                                weatherModel: self.$state.weatherModel)
                        )
                    ),
                    isActive: self.$state.resultsLoaded) {
                    Text("")
                  }.hidden()
            }
            .padding()
            .navigationTitle("Weather Lookup")
        }
    }
}

struct CityEntryView_Previews: PreviewProvider {
    static var previews: some View {
        CityEntryView(viewModel: CityEntryViewModel())
    }
}
