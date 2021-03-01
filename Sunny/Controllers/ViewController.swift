import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(forCiry: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
/* Delegate
        networkWeatherManager.delegate = self
*/
        networkWeatherManager.fetchCurrentWeather(forCiry: "Minsk")
    }
}

/* Delegate
extension ViewController: NetworkWeatherManagerDelegate {
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        print(currentWeather.cityName)
//        cityLabel.text = currentWeather.cityName
//        temperatureLabel.text = currentWeather.temperatureString
//        feelsLikeTemperatureLabel.text = currentWeather.feelsLikeTemperatureString
    }
}
*/
