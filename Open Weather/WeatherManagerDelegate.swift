//
//  WeatherManagerDelegate.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

protocol WeatherManagerDelegate {
    func didFetchData(_ data: WeatherData)
}
