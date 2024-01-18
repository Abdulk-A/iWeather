//
//  WeatherManager.swift
//  CityWeather2
//
//  Created by Abdullah Abdulkareem on 1/8/24.
//

import Foundation

//getting url
//make request
//create url session
//check status code
//return decodedData

//https://api.openweathermap.org/data/2.5/weather?q=tokyo&appid={API_KEY}

class WeatherManager {
    func getWeatherByCity(for city: String) async throws -> OpenWeather {
        //MAKE SURE TO PUT AN API KEY AFTER APPID TO MAKE THIS FUNCTION WORK
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=87224519965341d81858bdebace3e684") else {
            fatalError("could not load url for \(city)")
        }
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("could not fetch weather data")
        }
        
        let decodedData = try JSONDecoder().decode(OpenWeather.self, from: data)
        
        return decodedData
    }
}
