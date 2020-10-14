//
//  WeatherManagerDelegate.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

/// Contains ways through which data can be retrieved.
enum DataRetrievalLocation {
    case Database
    case API
}

/// Protocol used as delegate to present weather data on Views.
protocol WeatherManagerDelegate {
    /// Tells the delegate that weather data is available for provided city name from specified data retrieval location and is ready to present data on view.
    func didReadData(_ weatherData: Presentable, for city: String, from location: DataRetrievalLocation)
}
