//
//  Parsable.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

protocol Parsable {
    func parse(data: Data) -> WeatherData?
}

extension Parsable {
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
