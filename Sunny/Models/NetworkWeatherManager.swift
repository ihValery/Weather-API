import Foundation

/* Delegate
protocol NetworkWeatherManagerDelegate: class {
    //_: NetworkWeatherManager - из документации - пространство имен (могут совпадать названия методов)
    //Что бы не было пересечения в названиях методов, добавлем сам делегатор
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) -> Void
}
*/

class NetworkWeatherManager {
/* Delegate
    weak var delegate: NetworkWeatherManagerDelegate?
*/
 
    func fetchCurrentWeather(forCiry city: String) -> Void {
        //Без s будет ошибка, но можно добавить адрес в исключение
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        //Создаем сейссию (95% используется .default)
        let session = URLSession(configuration: .default)
        
        //completionHandler замыкание имеет 3 параметра и все они опциональны
        //После создания задачи вы должны запустить ее, вызвав ее метод resume ().
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    print(currentWeather.cityName)
/* Delegate
                    //self.delegate так как работаем внутри closuer
                    self.delegate?.updateInterface(self, with: currentWeather)
*/
                }
            }
        }.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
