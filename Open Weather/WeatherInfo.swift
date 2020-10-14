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
}
