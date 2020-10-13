//
//  WeatherData.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

/// This structure is the data model required to parse data from OpenWeatherMap API.
struct WeatherData: Decodable {
    let weather: [Weather]
    let main: Main
    let visibility: Double
    let wind: Wind
    let sys: Sys
    let name: String
}

// Weather Data Parameters
struct Weather: Decodable {
    let id: Int
    let description: String
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Decodable {
    let speed: Double
    let deg: Double
}

struct Sys: Decodable {
    let country: String
}

// Presentable Variables
extension WeatherData {
    // Weather Description
    var weatherDescriptionString: String {
        return weather.description
    }
    var temperatureString: String {
        return String(format: "%.1f ºC", main.temp)
    }
    var feelsLikeTemperatureString: String {
        return String(format: "%.1f ºC", main.feels_like)
    }
    var lowestTemperatureString: String {
        return String(format: "%.1f ºC", main.temp_min)
    }
    var highestTemperatureString: String {
        return String(format: "%.1f ºC", main.temp_max)
    }
}
