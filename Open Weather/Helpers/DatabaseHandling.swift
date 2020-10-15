//
//  DatabaseHandling.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation
import RealmSwift

/// Protocol used for handling Realm Database Operations.
protocol DatabaseHandling {
    /// This method stores weather data for provided city name in database.
    func store(weather: WeatherData, of city: String)
    /// This method loads all weather data from database or only for provided city name, depending on the function parameter availability.
    func load(weatherFor city: String?) -> Results<WeatherInfo>?
    /// This method returns weather data in presentable form to display data on view..
    func generatePresentableData(_ data: Results<WeatherInfo>) -> Presentable?
    /// This method loads data from database and removes objects which have crossed the timeInterval limit.
    /// IMPROVEMENT: Should execute while launching application and loading/fetching data.
    func removeDataHavingTimeInterval(_ timeInterval: TimeInterval)
}
