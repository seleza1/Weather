//
//  Double+TemperatureConversion.swift
//  Weather
//
//  Created by user on 21.02.2023.
//

import Foundation

extension Double {
    var kelvinToFahrenheit: Double {
        return (9.0 / 5) * (self - 273) + 32
    }
}
