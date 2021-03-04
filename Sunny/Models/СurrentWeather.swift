import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.0f", feelsLikeTemperature)
    }
    
    let conditionCode: Int
    var iconNameString: String {
        switch conditionCode {
            case 200...232: return "Thunderstorm"
            case 300...321: return "Drizzle"
            case 500...504: return "Rain"
            case 511:       return "Rain2"
            case 520...531: return "Drizzle"
            case 600...622: return "Snow"
            case 701...781: return "Atmosphere"
            case 800:       return "Sun"
            case 801:       return "Clouds1"
            case 802:       return "Clouds2"
            case 803...804: return "Clouds3"
            default: return "Search"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
