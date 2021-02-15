//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Kyle Stewart on 2/11/21.
//

import SwiftUI

protocol ViewModel: ObservableObject {
    associatedtype StateType
    associatedtype Event

    var state: StateType { get set }

    func notify(event: Event)
}
