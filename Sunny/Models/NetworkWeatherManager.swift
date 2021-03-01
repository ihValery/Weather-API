import Foundation

struct NetworkWeatherManager {
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
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }.resume()
    }
}
