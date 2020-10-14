//
//  DatabaseHandling.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation
import RealmSwift

protocol DatabaseHandling {
    func store(weather: WeatherData, of city: String)
    func load(weatherFor city: String?) -> Results<WeatherInfo>?
    func removeDataHavingTimeInterval(_ timeInterval: TimeInterval)
}
