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

    static func getWeather() -> [Weather] {
        [
            Weather(main: "Rain", description: "Cloud in the sky"),
            Weather(main: "Sunny", description: "Good weather")
        ]
    }
}

struct Temperatura: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct WeatherInfo: Decodable {
    let weather: [Weather]
    let main: Temperatura
}
