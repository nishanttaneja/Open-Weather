//
//  WeatherError.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

/// Errors occurred during tasks related to weather fetching.
enum WeatherError: Error {
    case APIKeyNotFound
    case APIURLNotFound
    case APINotFound
}
