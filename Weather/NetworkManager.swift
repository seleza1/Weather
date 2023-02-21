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

    static func fetchWeather(for cityId: Int = 5128581, _ completion: @escaping ((Weather) -> Void)) {
        if let url = Endpoint.cityId(id: cityId).url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error", error)
                }
                if let data = data {
                    guard let weather = try? JSONDecoder().decode(Weather.self, from: data) else { return }
                    completion(weather)

                }
            }.resume()
        }
    }
}
