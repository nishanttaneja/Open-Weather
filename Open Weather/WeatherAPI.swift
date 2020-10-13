//
//  WeatherAPI.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

enum WeatherAPI {
    case OpenWeatherMap
    
    enum Parameter {
        case city
        case unit
    }
}

extension WeatherAPI {
    func getUrl() throws -> String {
        switch self {
        case .OpenWeatherMap:
            return "https://api.openweathermap.org/data/2.5/weather?"
        @unknown default:
            print("url for selected api isn't registered")
            throw WeatherError.APIURLNotFound
        }
    }
    func getKey() throws -> String {
        switch self {
        case .OpenWeatherMap:
            return "871398ec921f8a0d4942d486dedc4d22"
        @unknown default:
            print("key for selected api isn't registered")
            throw WeatherError.APIKeyNotFound
        }
    }
    func getKeyWithParameterName() throws -> String {
        switch self {
        case .OpenWeatherMap:
            let key = "871398ec921f8a0d4942d486dedc4d22"
            return "appid=\(key)"
        @unknown default:
            print("key for selected api isn't registered")
            throw WeatherError.APIKeyNotFound
        }
    }
    func getParameterName(for parameter: Parameter) throws -> String {
        switch self {
        case .OpenWeatherMap:
            switch parameter {
            case .unit:
                return "units="
            case .city:
                return "q="
            }
        @unknown default:
            print("API isn't registered")
            throw WeatherError.APINotFound
        }
    }
}
