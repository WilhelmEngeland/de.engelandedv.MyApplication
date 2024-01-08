//
//  WeatherModel.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 09.09.21.
//

import Foundation

struct WeatherModel {
    // Stored property -> Value is simply stored / saved there
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let description: String
    
    // Additional information
    let sunrise: Double
    let sunset: Double
    let temp_max: Double
    let temp_min: Double
    let pressure: Int
    let humidity: Int
    let rain: Double
    let windSpeed: Double
    
    // computed Property -> Value is calculated every time
    var temperatureAsString: String {
        return String(format: "%.0f", temperature)
    }
    
    var temperatureMaxAsString: String {
        return String(format: "%.0f", temp_max)
    }
    
    var temperatureMinAsString: String {
        return String(format: "%.0f", temp_min)
    }
    
    var rainAsString: String {
        return String(format: "%.0f", rain)
    }
    
    // Finding the right pictures
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.sun"
        default:
            return "cloud"
        }
    }
}
