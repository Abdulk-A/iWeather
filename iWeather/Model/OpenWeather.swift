//
//  OpenWeather.swift
//  CityWeather2
//
//  Created by Abdullah Abdulkareem on 1/8/24.
//

import Foundation
import CoreLocation

struct OpenWeather: Codable {
    struct Coordinate: Codable {
        let lon: Double
        let lat: Double
    }
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
    }
    
    let coord: Coordinate
    let weather: [Weather]
    let main: Main
    let name: String
    let timezone: Int
    let dt: Int
}

//https://api.openweathermap.org/data/2.5/weather?q=tokyo&appid={API_KEY}


var exampleWeather: OpenWeather = load("DummyWeatherData")

func load<T: Decodable>(_ fileName: String)  -> T {
    
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: ".json") else {
        fatalError("could not find \(fileName).json from Main Bundle")
    }
    
    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("could not load \(fileName).json from main Bundle")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch{
        fatalError("could not decode data")
    }
    
    
}
