//
//  LoadedData.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

/// Structure to generate presentable data for view through data loaded from database.
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
