//
//  DatabaseHandling.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

protocol DatabaseHandling {
    func store(weather: WeatherData, of city: String)
    func load(weatherFor city: String?) -> Presentable?
    func removeDataHavingTimeInterval(_ timeInterval: TimeInterval)
}
