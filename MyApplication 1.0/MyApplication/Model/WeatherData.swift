//
//  WeatherData.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 09.09.21.
//

import Foundation

// Struct for translating the JSON
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let wind: Wind
    let sys: Sys
    let clouds: Clouds
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Decodable {
    let speed: Double
}

struct Sys: Decodable {
    let sunrise: Double
    let sunset: Double
}

struct Clouds: Decodable {
    let all: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
