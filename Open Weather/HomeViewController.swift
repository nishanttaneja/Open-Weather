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
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    // Initialise Weather Manager
    var weatherManager = WeatherManager(api: .OpenWeatherMap)
    
    // View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchBar.delegate = self
    }
    
    // User Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
    
    // IBAction
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        fetchWeather()
    }
}

extension HomeViewController {
    /// This method fetches weather data if searchbar contains some text, then removes text.
    func fetchWeather() {
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
    func didFetchData(_ data: WeatherData) {
        DispatchQueue.main.async {
            self.feelsLikeTempLabel.text = data.feelsLikeTemperatureString
            self.tempLabel.text = data.temperatureString
            self.highTempLabel.text = data.highestTemperatureString
            self.LowTempLabel.text = data.lowestTemperatureString
            self.weatherConditionImageView.image = UIImage(systemName: data.condition)
            self.weatherDescriptionLabel.text = data.weatherDescriptionString
            self.cityLabel.text = data.name
        }
    }
}

//MARK:- SearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchWeather()
    }
}
