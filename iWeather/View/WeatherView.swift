//
//  WeatherView.swift
//  CityWeather2
//
//  Created by Abdullah Abdulkareem on 1/8/24.
//
import MapKit
import SwiftUI

struct WeatherView: View {
    
    var weather: OpenWeather
    //https://openweathermap.org/img/wn/10d@2x.png
    

    
    var position: MapCameraPosition {
        .region(.init(            
            center: CLLocationCoordinate2D(
            latitude: weather.coord.lat,
            longitude: weather.coord.lon
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.2,
            longitudeDelta: 0.2
        )))
    }

    var body: some View {
        
        NavigationStack{
    
            VStack {
                ZStack {
                    Map(initialPosition: position)
                }
                .ignoresSafeArea()
                .overlay(
                    NavigationLink{
                        WeatherLinkView(weather: weather)
                    } label: {
                        WeatherViewTemp(weather: weather)
                    }, alignment: .top
                )
            }
            .preferredColorScheme(.dark)
        }
        


    }
}

#Preview {
    WeatherView(weather: exampleWeather)
}
