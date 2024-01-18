//
//  WeatherViewTemp.swift
//  CityWeather2
//
//  Created by Abdullah Abdulkareem on 1/9/24.
//

import SwiftUI

struct WeatherViewTemp: View {
    
    var weather: OpenWeather
    
    var body: some View {
        VStack(alignment: .center){
//            Text(weather.name)
//                .font(.largeTitle.bold())
            HStack (alignment: .center){
                Text("\(weather.main.temp.toFahrenheit())°")
                    .font(.largeTitle.bold())
                Spacer()
                    .frame(maxWidth: 20)
                WeatherIcon(weather: weather, imageSize: 75)
            }
            .frame(maxWidth: .infinity)
            .background(.black.opacity(0.5))
        }
    }
}

#Preview {
    WeatherViewTemp(weather: exampleWeather)
}
