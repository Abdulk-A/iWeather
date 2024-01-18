//
//  WeatherIcon.swift
//  CityWeather2
//
//  Created by Abdullah Abdulkareem on 1/9/24.
//

import SwiftUI

struct WeatherIcon: View {
    var weather: OpenWeather
    var imageSize: Int
    var body: some View {
        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: CGFloat(imageSize))
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    WeatherIcon(weather: exampleWeather, imageSize: 75)
}
