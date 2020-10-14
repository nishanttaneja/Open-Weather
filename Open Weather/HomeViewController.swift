//
//  HomeViewController.swift
//  Open Weather
//
//  Created by Nishant Taneja on 13/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var feelsLikeTempLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var LowTempLabel: UILabel!
    @IBOutlet weak var weatherConditionImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    // Initialise Weather Manager
    var weatherManager = WeatherManager(api: .OpenWeatherMap)
}

//MARK:- Override
extension HomeViewController {
    // View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.modifyAttributes(forWeatherCondition: "")
        weatherManager.delegate = self
        weatherManager.removeDataHavingTimeInterval(86400)      // 24 hours
        searchBar.delegate = self
    }
    // User Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
}

//MARK:- SearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.isSearchable() {
            weatherManager.fetchWeather(for: searchBar.text!)
            DispatchQueue.main.async {
                self.searchBar.text = nil
            }
            if searchBar.isFirstResponder {
                searchBar.endEditing(true)
            }
        }
    }
}

//MARK:- WeatherManagerDelegate
extension HomeViewController: WeatherManagerDelegate {
    func didReadData(_ weatherData: Presentable, for city: String, from location: DataRetrievalLocation) {
        feelsLikeTempLabel.text = weatherData.feelsLikeTemperatureString
        tempLabel.text = weatherData.temperatureString
        highTempLabel.text = weatherData.highestTemperatureString
        LowTempLabel.text = weatherData.lowestTemperatureString
        weatherConditionImageView.image = UIImage(named: weatherData.condition)
        cityLabel.text = weatherData.city
    }
}
