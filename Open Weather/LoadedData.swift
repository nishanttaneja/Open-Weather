//
//  LoadedData.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

struct LoadedData: Presentable {
    var city: String
    var temperatureString: String
    var feelsLikeTemperatureString: String
    var highestTemperatureString: String
    var lowestTemperatureString: String
    var condition: String
    var weatherDescriptionString: String
    var lastFetchedAt: Date
}
