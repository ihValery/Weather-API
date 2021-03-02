import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    @IBAction func searchPressed(_ sender: UIButton) {
        //[weak self] - на будущее если разрастется app и будет несколько экранов
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forCiry: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
/* Delegate
        networkWeatherManager.delegate = self
*/
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(forCiry: "Minsk")
    }
    
    func updateInterfaceWith(weather: CurrentWeather) -> Void {
        //Вызываем главную очереди и просим выполнить асинхронно - не ждем выполнения блока
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
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
