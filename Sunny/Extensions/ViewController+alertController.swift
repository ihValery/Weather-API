import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?,
                                      style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        //Создаем наш алерт и передаем все входные параметры из нашей функции
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        //добавляем текстовое поле в алерт контроллер
        ac.addTextField { tf in
            let cities = ["Minsk", "Sydney", "New York", "Stambul"]
            tf.placeholder = cities.randomElement()
        }
        //Создаем кнопку Search
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                //Простой вариант использования, но мы учимся через closure
                //self.networkWeatherManager.fetchCurrentWeather(forCiry: cityName)
                
                //Если cityName состоит из нескольких элементов разделенных " ", (через массив) соединяет их заменив на %20
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        //Создаем Cancel
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Добавление кнопок в алерт контроллер
        ac.addAction(search)
        ac.addAction(cancel)
        //Отображение алерт контроллера
        present(ac, animated: true, completion: nil)
    }
}
