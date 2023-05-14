//
//  ViewController.swift
//  weaterdataAPIapp
//
//  Created by Deepak Gupta on 24/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var updatetimeLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var WindDirection: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData()
    {
        let url = URL (string: "https://api.weatherapi.com/v1/current.json?key=591422ca1b1c4f95879172402232401&q=India&aqi=no")
        
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            guard let data = data, error == nil else
            {
                print("Error Occured while Accessing Data with URL")
                return
            }
            var fullWeatherData:WeatherData?
            do{
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            }
            catch{
                print("Error Occured While Decoding JSON into Swift Structure \(error)")
            }
            DispatchQueue.main.async {
                self.updatetimeLabel.text = "Updated: \(fullWeatherData!.current.last_updated)"
                self.regionLabel.text = "Region: \(fullWeatherData!.location.region)"
                self.countryLabel.text = "Country: \(fullWeatherData!.location.country)"
                self.temperatureLabel.text = "Temperature (Celsius): \(fullWeatherData!.current.temp_c)"
                self.humidityLabel.text = "Humidity: \(fullWeatherData!.current.humidity)"
                self.windLabel.text = "Wind (km/Hr): \(fullWeatherData!.current.wind_kph)"
                self.WindDirection.text = "Wind Direction: \(fullWeatherData!.current.wind_dir)"
            }
        })
        dataTask.resume()
    }

    @IBAction func refreshData(_ sender: Any) {
        
        
    }
}

