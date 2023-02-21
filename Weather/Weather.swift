//
//  Weather.swift
//  Weather
//
//  Created by user on 20.02.2023.
//

import Foundation

struct Weather: Decodable {
    var main: Main

    struct Main: Decodable {
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
        var pressure: Double
        var humidity: Double

        enum CodingKeys: String, CodingKey {
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case temp
            case pressure
            case humidity
        }

    }
}
