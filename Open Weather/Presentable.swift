//
//  Presentable.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

protocol Presentable {
    var city: String { get }
    var condition: String { get }
    var weatherDescriptionString: String { get }
    var temperatureString: String { get }
    var feelsLikeTemperatureString: String { get }
    var highestTemperatureString: String { get }
    var lowestTemperatureString: String { get }
    var lastFetchedAt: Date { get }
}
