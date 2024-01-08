//
//  WeatherViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    //MARK: - Outlet
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperaturLabel: UILabel!
    @IBOutlet weak var weaterImageView: UIImageView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nextPageImage: UIImageView!
    @IBOutlet weak var searchInfoLabel: UILabel!
    
    
    //MARK: - Variablen
    let infoDetailAlert = InfoDetailAlert()
    var timer = Timer()
    var weatherManager = WeatherManager()
    var _weatherInfoObject: WeatherModel? = nil
    var isData = false
    var isHidden = true
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTextField.delegate = self
        weatherManager.delegate = self

        createButtonLabel()
        SetIsHidden()

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.currenTime), userInfo: nil, repeats: true)
    }
    
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createText()
        setDate()
    }
    

    //MARK: - Create InfoDetail Button Tap
    @IBAction func infoDetailButton(_ sender: Any) {
        infoDetailAlert.infoDetail(_text: Language.language.infoDetailWeatherViewController, _view: self)
    }
    
    
    //MARK: - Info for Search City
    @IBAction func searchButton(_ sender: Any) {
        if cityLabel.text != "" {
            // No function
        } else {
            searchInfoLabel.isHidden = false
        }
    }


    //MARK: - Change Button, Label and Text

    // Create Button and Label
    func createButtonLabel() {
        nextPageImage.layer.cornerRadius = 20
        cityLabel.layer.masksToBounds = true
        cityLabel.layer.cornerRadius = 5
        statusLabel.layer.masksToBounds = true
        statusLabel.layer.cornerRadius = 10
        temperaturLabel.layer.masksToBounds = true
        temperaturLabel.layer.cornerRadius = 20
        weaterImageView.layer.cornerRadius = 20
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 10
        timeLabel.layer.masksToBounds = true
        timeLabel.layer.cornerRadius = 10
        searchInfoLabel.layer.masksToBounds = true
        searchInfoLabel.layer.cornerRadius = 10

        cityTextField.placeholder = Language.language.cityTextFieldText
        searchInfoLabel.text = Language.language.searchInfoLabelText
    }


    // Create Text
    func createText() {
        cityTextField.placeholder = Language.language.cityTextFieldText
        searchInfoLabel.text = Language.language.searchInfoLabelText
    }


    // Label set hidden
    func SetIsHidden() {
        if isHidden == true {
            nextPageImage.isHidden = true
            cityLabel.isHidden = true
            statusLabel.isHidden = true
            temperaturLabel.isHidden = true
            weaterImageView.isHidden = true
        } else {
            nextPageImage.isHidden = false
            cityLabel.isHidden = false
            statusLabel.isHidden = false
            temperaturLabel.isHidden = false
            weaterImageView.isHidden = false
        }
    }


    // Clear Data and nil Label
    func clearWeaterInfoObject() {
        SetIsHidden()
        isHidden = false
        temperaturLabel.text = ""
        cityLabel.text = ""
        statusLabel.text = ""
        weaterImageView.image = UIImage(systemName: "")
        _weatherInfoObject = nil
    }


    //MARK: - TouchesBegan to next ViewController
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isData == true {
            performSegue(withIdentifier: "segueToInfoViewController", sender: nil)
        } else {
            // No function
        }
    }


    //MARK: - Push data from WeatherInfoViewController to WeatherViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToInfoViewController" {
            let weatherInfoVC = segue.destination as! WeatherInfoViewController
            weatherInfoVC.weatherInfoObject = _weatherInfoObject
        }
    }


    //MARK: - Show Time
    @objc func currenTime() {
        let formetter = DateFormatter()
        formetter.dateFormat = "HH:mm"
        timeLabel.text = "\(Language.language.timeText): " + formetter.string(from: Date())
    }


    //MARK: - Show Date
    func setDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        formatter.locale = Locale(identifier: "de_DE")
        dateLabel.text = "\(Language.language.dateText): " + formatter.string(from: Date())
    }


    //MARK: - Function from Protocol UITextFieldDelegate

    // Someone started typing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        isData = false
        isHidden = true
        searchInfoLabel.isHidden = true
        clearWeaterInfoObject()
    }


    // Someone pressed the return button, should I retract the keyboard?
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityTextField.endEditing(true)
        return true
    }


    // Someone has finished typing, should I retract the keyboard?
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {

            UIView.animate(withDuration: 7.0) {
                self.searchInfoLabel.isHidden = true
                self.nextPageImage.alpha = CGFloat(0)
            }
            return true
        } else {
            return false
        }
    }


    // Someone has finished typing, retract the keyboard!
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Start searching for the weather data
        if let _cityName = cityTextField.text {
            weatherManager.fetchWeather(cityName: _cityName.convertedToSlug()!)
        }
        cityTextField.text = ""
    }


    //MARK: - Uptate the Label with new data
    func didUpdateWeather(weather: WeatherModel) {

        DispatchQueue.main.async {
            self.SetIsHidden()
            self.temperaturLabel.text = weather.temperatureAsString + "°"
            self.cityLabel.text = weather.cityName
            self.statusLabel.text = "\(Language.language.statusFirstText): \(weather.description). \(Language.language.statusSecondText) \(weather.temperatureMaxAsString)°."
            self.weaterImageView.image = UIImage(systemName: weather.conditionName)

            self._weatherInfoObject = weather
            self.isData = true
            self.isHidden = true
        }
    }

    //MARK: - Uptate the Label without data
    func notFoundWeather(_isHidden: Bool) {

        DispatchQueue.main.async {
            self.searchInfoLabel.isHidden = _isHidden
        }
    }
}


// MARK: - Extension for convert a string to a safe format for URL
extension String {
    private static let slugSafeCharacters = CharacterSet(charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-")

    public func convertedToSlug() -> String? {
        if let latin = self.applyingTransform(StringTransform("Any-Latin; Latin-ASCII; Lower;"), reverse: false) {
            let urlComponents = latin.components(separatedBy: String.slugSafeCharacters.inverted)
            let result = urlComponents.filter { $0 != "" }.joined(separator: "-")

            if result.count > 0 {
                return result
            }
        }
        return nil
    }
}
