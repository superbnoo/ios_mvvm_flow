//
//  Weather+Stub.swift
//  WeatherTests
//
//  Created by An Tran on 04/12/2022.
//

import Foundation

extension Weather {
    static func stub(id: Weather.Identifier = "id1",
                city: String = "New York" ,
                temperature: String = "32°C",
                weather: String = "overcast") -> Self {
        Weather(id: id, city: city, temperature: temperature, weather: weather)
    }
}
