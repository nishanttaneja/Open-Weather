//
//  WeatherManagerDelegate.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

enum DataRetrievalLocation {
    case Database
    case API
}

protocol WeatherManagerDelegate {
    func didReadData(_ weatherData: Presentable, for city: String, from location: DataRetrievalLocation)
}
