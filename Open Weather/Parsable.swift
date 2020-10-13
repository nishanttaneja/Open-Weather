//
//  Parsable.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

/// Protocol used for parsing weather data.
protocol Parsable {
    func parse(data: Data) -> WeatherData?
}

extension Parsable {
    /// This method parses WeatherData from retrieved data.
    func parse(data: Data) -> WeatherData? {
        print("parsing data...")
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            return weatherData
        } catch {
            print(error)
        }
        print("unidentified error occurred")
        return nil
    }
}
