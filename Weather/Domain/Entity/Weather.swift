//
//  Weather.swift
//  Weather
//
//  Created by An Tran on 04/12/2022.
//

import Foundation

//struct Weather: Equatable, Identifiable {
//    typealias Identifier = String
////    enum Genre {
////        case adventure
////        case scienceFiction
////    }
//    let id: Identifier
////    let title: String?
////    let genre: Genre?
////    let posterPath: String?
////    let overview: String?
////    let releaseDate: Date?
//    let name: String?
//}

struct Weather: Codable, Equatable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let city: String
    let temperature: String
    let weather: String
}

struct WeatherPage {
    let page: Int
    let totalPages: Int
    let weathers: [Weather]
}
