//
//  WeatherManager.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation
import RealmSwift

/// Structure used to manage tasks related to request creation, execution and fetching weather data using API.
struct WeatherManager: Parsable {
    let realm = try! Realm()
    var api: WeatherAPI
    var delegate: WeatherManagerDelegate?
    
    /// This method creates an URL for API request.
    private func createRequest(for city: String) -> URL? {
        if let baseUrlString = try? api.getUrl(), let apiKeyWithParameterName = try? api.getKeyWithParameterName(), let cityWithParameterName = try? api.getParameterName(for: .city) + city.replacingOccurrences(of: " ", with: "%20"), let unitWithParameterName = try? api.getParameterName(for: .unit) + "metric" {
            let urlString = baseUrlString + cityWithParameterName + "&" + unitWithParameterName + "&" + apiKeyWithParameterName
            if let url = URL(string: urlString) {
                return url
            }
        }
        return nil
    }
    /// This methods calls necessary methods to fetch weather data.
    func fetchWeather(for city: String) {
        if let databaseResults = load(weatherFor: city) {
            if let presentableData = generatePresentableData(databaseResults) {
                DispatchQueue.main.async {
                    delegate?.didReadData(presentableData, for: city, from: .Database)
                }
            }
        } else if let url = createRequest(for: city) {
            performRequest(for: url)
        }
    }
    /// This method creates a session and retrieves data using API.
    private func performRequest(for url: URL) {
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data, urlResponse, error) in
            if let sessionError = error {
                print(sessionError)
                return
            }
            guard let sessionData = data else {
                fatalError("error reading session data")
            }
            if let parsedData = parse(data: sessionData) {
                DispatchQueue.main.async {
                    store(weather: parsedData, of: parsedData.city)
                    delegate?.didReadData(parsedData, for: parsedData.city, from: .API)
                }
            }
        }
        dataTask.resume()
    }
}

//MARK:- Database Handling
extension WeatherManager: DatabaseHandling {
    func store(weather: WeatherData, of city: String) {
        do {
            let weatherInfo = WeatherInfo()
            weatherInfo.addParameters(for: city, weather.temperatureString, weather.feelsLikeTemperatureString, weather.highestTemperatureString, weather.lowestTemperatureString, weather.condition)
            try realm.write {
                realm.add(weatherInfo)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    func load(weatherFor city: String? = nil) -> Results<WeatherInfo>? {
        var databaseResult: Results<WeatherInfo>?
        if let cityName = city {
            let cityPredicate = NSPredicate(format: "city CONTAINS %@", cityName)
            databaseResult = realm.objects(WeatherInfo.self).filter(cityPredicate)
        } else {
            databaseResult = realm.objects(WeatherInfo.self)
        }
        if databaseResult?.count == 0 {
            return nil
        }
        return databaseResult
    }
    func generatePresentableData(_ data: Results<WeatherInfo>) -> Presentable? {
        guard let firstResult = data.first else {
            print("error loading first element from results")
            return nil
        }
        return LoadedData(city: firstResult.city, temperatureString: firstResult.temperature, feelsLikeTemperatureString: firstResult.feelsLike, highestTemperatureString: firstResult.highestTemperature, lowestTemperatureString: firstResult.lowestTemperature, condition: firstResult.condition, lastFetchedAt: firstResult.fetchedAt)
    }
    func removeDataHavingTimeInterval(_ timeInterval: TimeInterval) {
        if let databaseResults = load() {
            for result in databaseResults {
                let timeDifference = Date().timeIntervalSince(result.fetchedAt)
                if timeDifference > timeInterval {
                    // Remove object
                    do {
                        try realm.write {
                            realm.delete(result)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
