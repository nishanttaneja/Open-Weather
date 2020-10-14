//
//  WeatherInfo.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation
import RealmSwift

class WeatherInfo: Object {
    @objc dynamic var city = ""
    @objc dynamic var fetchedAt = Date()
    @objc dynamic var temperature = ""
    @objc dynamic var feelsLike = ""
    @objc dynamic var highestTemperature = ""
    @objc dynamic var lowestTemperature = ""
    @objc dynamic var condition = ""
    
    /// This method makes updating values of an instance easier.
    func addParameters(for city: String, _ temperature: String, _ feelsLike: String, _ highestTemperature: String, _ lowestTemperature: String, _ condition: String) {
        self.city = city
        self.temperature = temperature
        self.feelsLike = feelsLike
        self.highestTemperature = highestTemperature
        self.lowestTemperature = lowestTemperature
        self.condition = condition
    }
}
