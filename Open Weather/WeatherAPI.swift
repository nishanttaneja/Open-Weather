//
//  WeatherAPI.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

/// Enumeration of Weather APIs for using multiple APIs.
enum WeatherAPI {
    case OpenWeatherMap
    
    /// Enumeration of API parameters.
    enum Parameter {
        case city
        case unit
    }
}

extension WeatherAPI {
    /// This method returns URL String for selected WeatherAPI.
    func getUrl() throws -> String {
        switch self {
        case .OpenWeatherMap:
            return "https://api.openweathermap.org/data/2.5/weather?"
        @unknown default:
            print("url for selected api isn't registered")
            throw WeatherError.APIURLNotFound
        }
    }
    
    /// This method returns Key as String for selected WeatherAPI.
    func getKey() throws -> String {
        switch self {
        case .OpenWeatherMap:
            return "871398ec921f8a0d4942d486dedc4d22"
        @unknown default:
            print("key for selected api isn't registered")
            throw WeatherError.APIKeyNotFound
        }
    }
    
    /// This method returns Key with respective Parameter Name as String according to selected WeatherAPI.
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
    
    /// This method returns Parameter Name as String for provided Parameter.
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
