//
//  WeatherListItemViewModel.swift
//  Weather
//
//  Created by An Tran on 04/12/2022.
//

import Foundation

struct WeatherListItemViewModel: Equatable {
    let title: String
    let temperature: String
    let weather: String
}

extension WeatherListItemViewModel {

    init(weather: Weather) {
        self.title = weather.city
        self.temperature = weather.temperature
        self.weather = weather.weather
    }
    
    var detailedWeather: String {
        return String(format: "%@ | %@", weather, temperature)
    }
}
