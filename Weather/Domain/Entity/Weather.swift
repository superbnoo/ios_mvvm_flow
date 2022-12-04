//
//  Weather.swift
//  Weather
//
//  Created by An Tran on 04/12/2022.
//

import Foundation

struct Weather: Codable, Equatable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let city: String
    let temperature: String
    let weather: String
}
