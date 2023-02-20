//
//  NetworkController.swift
//  Weather
//
//  Created by user on 20.02.2023.
//

import Foundation

struct NetworkController {
    private static var url = "https://api.openweathermap.org/data/2.5/weather"

    enum Endpoint {
        case cityId(Int)

        var queryParameters: [URLQueryItem] {

            var queryParameters = [URLQueryItem]()

            switch self {
            case .cityId(let id):
                queryParameters.append(URLQueryItem(name: "id", value: String(id)))
            }
            queryParameters.append(URLQueryItem(name: "appid", value: "1234"))
            return queryParameters
        }
    }
}
