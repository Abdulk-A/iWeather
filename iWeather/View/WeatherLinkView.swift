//
//  WeatherLinkView.swift
//  CityWeather2
//
//  Created by Abdullah Abdulkareem on 1/9/24.
//

import SwiftUI

struct WeatherLinkView: View {
    
    var weather: OpenWeather
    var dateSince: Date{
        Date(timeIntervalSince1970: TimeInterval(weather.dt))
    }

    
    var body: some View {
        VStack{
            
            HStack(alignment: .center){
                Text(weather.name)
                    .font(.largeTitle.bold())
                Text("\(weather.main.temp.toFahrenheit())°")
                    .font(.title)
            }
            
            .padding(.bottom,5)
            Text(weather.weather[0].description)
                .font(.title3)
            Spacer()
            WeatherIcon(weather: weather, imageSize: 200)
                .overlay{
                    Circle().stroke(.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }
            Spacer()
            Text(dateSince.formatted(.dateTime.month().day().year()))
            Text(dateSince.formatted(.dateTime.hour().minute()))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
        .padding()
        
    }
}

#Preview {
    WeatherLinkView(weather: exampleWeather)
}
