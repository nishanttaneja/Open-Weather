//
//  WeatherManager.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import Foundation

/// Structure used to manage tasks related to request creation, execution and fetching weather data using API.
struct WeatherManager {
    var api: WeatherAPI
    
    /// This method creates an URL for API request.
    private func createRequest(for city: String) -> URL? {
        print("creating request...")
        if let baseUrlString = try? api.getUrl(), let apiKeyWithParameterName = try? api.getKeyWithParameterName(), let cityWithParameterName = try? api.getParameterName(for: .city) + city, let unitWithParameterName = try? api.getParameterName(for: .unit) + "metric" {
            let urlString = baseUrlString + cityWithParameterName + "&" + unitWithParameterName + "&" + apiKeyWithParameterName
            if let url = URL(string: urlString) {
                return url
            }
        }
        return nil
    }
    
    /// This methods calls necessary methods to fetch weather data.
    func fetchWeather(for city: String) {
        print("fetching weather...")
        if let url = createRequest(for: city) {
            performRequest(for: url)
        }
    }
}

extension WeatherManager: Parsable {
    /// This method creates a session and retrieves data using API.
    private func performRequest(for url: URL) {
        print("performing request...")
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data, urlResponse, error) in
            if let sessionError = error {
                print(sessionError)
                return
            }
            guard let sessionData = data else {
                fatalError("error reading session data")
            }
            print("should parse data.")
            if let parsedData = parse(data: sessionData) {
                print(parsedData.main.feels_like)
            }
            print("parsing data successful")
        }
        dataTask.resume()
    }
}
