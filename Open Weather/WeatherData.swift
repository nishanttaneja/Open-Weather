//
//  WeatherData.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

/// This structure is the data model required to parse data from OpenWeatherMap API.
struct WeatherData: Decodable {
    let weather: [Weather]?
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
extension WeatherData: Presentable {
    var lastFetchedAt: Date {
        return Date()
    }
    var city: String {
        return name
    }
    var weatherDescriptionString: String {
        return weather![0].description
    }
    var temperatureString: String {
        return String(format: "%.1fºC", main.temp)
    }
    var feelsLikeTemperatureString: String {
        return String(format: "Feels like: %.1fºC", main.feels_like)
    }
    var lowestTemperatureString: String {
        return String(format: "L: %.1fºC", main.temp_min)
    }
    var highestTemperatureString: String {
        return String(format: "H: %.1fºC", main.temp_max)
    }
    var condition: String {
        switch weather![0].id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
