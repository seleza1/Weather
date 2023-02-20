//
//  NetworkController.swift
//  Weather
//
//  Created by user on 20.02.2023.
//

import Foundation

struct NetworkController {
    private static var url = "https://api.openweathermap.org"

    enum Endpoint {
        case cityId(path: String = "/data/2.5/weather", id: Int)

        var urlL: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = url
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
            queryParameters.append(URLQueryItem(name: "appid", value: "1234"))
            return queryParameters
        }
    }
}
