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
    
    // Initialise Weather Manager
    var weatherManager = WeatherManager(api: .OpenWeatherMap)
    
    // Override View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchBar.delegate = self
    }
    
    // IBAction
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        fetchWeather()
    }
    
    func fetchWeather() {
        if searchBar.isSearchable() {
            weatherManager.fetchWeather(for: searchBar.text!)
            DispatchQueue.main.async {
                self.searchBar.text = nil
            }
        }
    }
}

//MARK:- WeatherManagerDelegate
extension HomeViewController: WeatherManagerDelegate {
    func didFetchData(_ data: WeatherData) {
        DispatchQueue.main.async {
            self.feelsLikeTempLabel.text = data.feelsLikeTemperatureString
            self.tempLabel.text = data.temperatureString
            self.highTempLabel.text = data.highestTemperatureString
            self.LowTempLabel.text = data.lowestTemperatureString
        }
    }
}

//MARK:- SearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
}
