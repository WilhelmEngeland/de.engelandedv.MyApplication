//
//  WeatherManager.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 09.09.21.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func notFoundWeather(_isHidden: Bool)
}

struct WeatherManager {
    
    //MARK: - Variablen
    let UNIT = "Metric"
    let LANGUAGE = "de"
    //let ID = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    let ID = "7086828e887b4611b40085213b90e25b"
    let WEATHER_URL_BY_CITYNAME = "https://api.openweathermap.org/data/2.5/weather?q="
    var delegate: WeatherManagerDelegate?
    
    
    //MARK: - Create URL for fetch weather
    func fetchWeather(cityName: String) {
        let urlAsString = WEATHER_URL_BY_CITYNAME + cityName + "&appid=\(ID)" + "&units=\(UNIT)" + "&lang=\(LANGUAGE)"
        performRequest(urlString: urlAsString)
    }
    
    
    //MARK: - Function for perform request
    func performRequest(urlString: String) {
        // 1. Create url
        guard let url = URL(string: urlString) else { return }
        // 2. Create URL Session
        let session = URLSession(configuration: .default)
        // 3. Create the task
        let task = session.dataTask(with: url) { (data, urlResponse, error) in
            if error != nil {
                print(error!)
                return
            }
            if let _data = data {
                let dataString = String(data: _data, encoding: .utf8)
                print(dataString!)
                if let weather = parseJSON(weatherData: _data) {
                    // Send the weather object to the WeatherViewController
                    self.delegate?.didUpdateWeather(weather: weather)
                } else {
                    self.delegate?.notFoundWeather(_isHidden: false)
                }
            }
        }
        // 4. start task
        task.resume()
    }
    
    
    //MARK: - Parse and decode JSON
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let description = decodeData.weather[0].description
            let name = decodeData.name
            
            
            // Decode additional information from the JSON format
            let sunrise = decodeData.sys.sunrise
            let sunset = decodeData.sys.sunset
            let temp_max = decodeData.main.temp_max
            let temp_min = decodeData.main.temp_min
            let pressure = decodeData.main.pressure
            let humidity = decodeData.main.humidity
            let rain = decodeData.clouds.all
            let windSpeed = decodeData.wind.speed
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, description: description, sunrise: sunrise, sunset: sunset, temp_max: temp_max, temp_min: temp_min, pressure: pressure, humidity: humidity, rain: rain, windSpeed: windSpeed)
            
            return weather
        } catch {
            return nil
        }
    }
}
