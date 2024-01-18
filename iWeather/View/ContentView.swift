//
//  ContentView.swift
//  CityWeather2
//
//  Created by Abdullah Abdulkareem on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city = "tokyo"
    @State private var weather: OpenWeather?
    @State private var showWeather = false
    @State private var isFetching = false
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.blue,.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                VStack(alignment: .center){
                    HStack{
                        TextField("NYC", text: $city)
                        Button{
                            Task{
                                isFetching = true
                                do{
                                    weather = try await WeatherManager().getWeatherByCity(for: city)
                                    showWeather.toggle()
                                    isFetching = false
                                } catch{
                                    print("erorr getting weather for \(city)")
                                    isFetching = false
                                }
                            }
                        } label: {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        }
                    }
                    .font(.headline.bold())
                    .foregroundStyle(.white)
                }
                
        
                .frame(maxWidth: .infinity)
                .padding()
                
                .background(.secondary)
                .padding()
                .sheet(isPresented: $showWeather, content: {
                    
                    if isFetching {
                        ProgressView()
                    } else if let weather = weather {
                        WeatherView(weather: weather)
                    }

                })
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
