//
//  NetworkController.swift
//  Weather
//
//  Created by user on 20.02.2023.
//

import Foundation

struct NetworkController {
    private static var baseUrl = "https://api.openweathermap.org"
    private static var apiKey = "369e313851897f00cc3919355793d21a"

    enum Endpoint {
        case cityId(path: String = "/data/2.5/weather", id: Int)

        var url: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = baseUrl
            components.path = path
            components.queryItems = queryParameters

            return components.url
        }

        private var path: String {
            switch self {
            case .cityId(let path, _):
                return path
            }
        }

        private var queryParameters: [URLQueryItem] {

            var queryParameters = [URLQueryItem]()

            switch self {
            case .cityId(_, let id):
                queryParameters.append(URLQueryItem(name: "id", value: String(id)))
            }
            queryParameters.append(URLQueryItem(name: "appid", value: apiKey))
            return queryParameters
        }
    }

    static func fetchWeather() {
        //Endpoint.cityId(id: 123).url

//        if let url = Endpoint.cityId(id: 5128581) {
//            
//        }
    }
}
