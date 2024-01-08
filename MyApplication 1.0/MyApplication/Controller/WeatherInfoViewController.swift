//
//  WeatherInfoViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 09.09.21.
//

import UIKit

class WeatherInfoViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var weatherInfoLabel: UILabel!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var luftdruckLabel: UILabel!
    @IBOutlet weak var luftfeuchtigkeitLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var sunriseTextLabel: UILabel!
    @IBOutlet weak var sunsetTextLabel: UILabel!
    @IBOutlet weak var maxTempTextLabel: UILabel!
    @IBOutlet weak var minTempTextLabel: UILabel!
    @IBOutlet weak var luftdruckTextLabel: UILabel!
    @IBOutlet weak var luftfeuchtigkeitTextLabel: UILabel!
    @IBOutlet weak var rainTextLabel: UILabel!
    @IBOutlet weak var windSpeedTextLabel: UILabel!
    
    
    
    //MARK: - Variablen
    var weatherInfoObject: WeatherModel? = nil
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        createText()
        createLabel()
        showData(weatherObject: weatherInfoObject)
    }
    
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidLoad()
    }
    
    
    //MARK: - Create Label and Text
    
    // Create Label
    func createLabel() {
        sunriseLabel.layer.masksToBounds = true
        sunriseLabel.layer.cornerRadius = 5
        sunsetLabel.layer.masksToBounds = true
        sunsetLabel.layer.cornerRadius = 5
        maxTempLabel.layer.masksToBounds = true
        maxTempLabel.layer.cornerRadius = 5
        minTempLabel.layer.masksToBounds = true
        minTempLabel.layer.cornerRadius = 5
        luftdruckLabel.layer.masksToBounds = true
        luftdruckLabel.layer.cornerRadius = 5
        luftfeuchtigkeitLabel.layer.masksToBounds = true
        luftfeuchtigkeitLabel.layer.cornerRadius = 5
        rainLabel.layer.masksToBounds = true
        rainLabel.layer.cornerRadius = 5
        windSpeedLabel.layer.masksToBounds = true
        windSpeedLabel.layer.cornerRadius = 5
    }
    
    
    // Create Text
    func createText() {
        weatherInfoLabel.text = Language.language.weatherInfoLabelText
        sunriseTextLabel.text = Language.language.sunriseTextLabelText
        sunsetTextLabel.text = Language.language.sunsetTextLabelText
        maxTempTextLabel.text = Language.language.maxTempTextLabelText
        minTempTextLabel.text = Language.language.minTempTextLabelText
        luftdruckTextLabel.text = Language.language.luftdruckTextLabelText
        luftfeuchtigkeitTextLabel.text = Language.language.luftfeuchtigkeitTextLabelText
        rainTextLabel.text = Language.language.rainTextLabelText
        windSpeedTextLabel.text = Language.language.windSpeedTextLabelText
    }
    
    
    //MARK: - TouchesBegan to go back WeatherViewController
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Uptade Label data
    func showData(weatherObject: WeatherModel?) {
        guard let weatherData = weatherObject else { return }
        
        sunriseLabel.text = "\(createTime(time: weatherData.sunrise))"
        sunsetLabel.text = "\(createTime(time: weatherData.sunset))"
        maxTempLabel.text = "  \(weatherData.temperatureMaxAsString)°"
        minTempLabel.text = "  \(weatherData.temperatureMinAsString)°"
        luftdruckLabel.text = "  \(weatherData.pressure) hPa"
        luftfeuchtigkeitLabel.text = "  \(weatherData.humidity)%"
        rainLabel.text = "  \(weatherData.rainAsString)%"
        windSpeedLabel.text = "  \(weatherData.windSpeed) km/h"
    }
    
    
    //MARK: - Create correct time
    func createTime(time: Double) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateTime = Date(timeIntervalSince1970: time)
        let timeAsString = formatter.string(from: dateTime)
        return timeAsString
    }
}
