//
//  Weather.swift
//  WeatherForecast
//
//  Created by Alexey Kanaev on 5/7/23.
//

import Foundation

struct Weather: Decodable {
    let main: String
    let description: String
    
    var title: String {
        "\(main) - \(description)"
    }

    static func getWeather() -> [Weather] {
        [
            Weather(main: "Rain", description: "Cloud in the sky"),
            Weather(main: "Sunny", description: "Good weather")
        ]
    }
}
