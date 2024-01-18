//
//  Extensions.swift
//  CityWeather2
//
//  Created by Abdullah Abdulkareem on 1/8/24.
//

import Foundation

extension Double{
    //from kelvin to fahrenheit
    func toFahrenheit() -> String {
        let temp = (self - 273.15) * 1.8 + 32.0
        return String(format: "%.0f", temp)
    }
    //from kelvin to celsius
    func toCelsius() -> String {
        let temp = self - 273.15
        return String(format: "%.0f", temp)
    }
}
