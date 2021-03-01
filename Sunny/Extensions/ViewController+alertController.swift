import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style) {
        //Создаем наш алерт и передаем все входные параметры из нашей функции
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        //добавляем текстовое поле в алерт контроллер
        ac.addTextField { tf in
            let cities = ["Minsk", "Sidney", "New York", "Stambul", "Rim"]
            tf.placeholder = cities.randomElement()
        }
        //Создаем кнопку Search
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                print("search info for the \(cityName)")
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
