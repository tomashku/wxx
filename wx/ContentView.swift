//
//  ContentView.swift
//  wx
//
//  Created by Tomasz Zuczek on 18/06/2022.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @State var route = ""
    @State var alternate = 0
    let api = "f394d1-2f1e46"
    @StateObject var locationManager = LocationManager()
    
    
    
    var body: some View {
        VStack(alignment: .center) {
            if let location = locationManager.location{
                Text("\(convertPositionToString(location: location))")
            }else{
                Text("")
            }
            TextField("DEP / DST", text: $route)
                .multilineTextAlignment(.center)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.cyan, lineWidth: 1))
                .frame(width: UIScreen.main.bounds.width/1.5)
            
                .disableAutocorrection(true)
                .font(Font.custom("Helvetica", size: 24))
            //                .padding()
                .textInputAutocapitalization(.characters)
            
            
            if route.count > 3 {
                Picker("make a selection", selection: $alternate) {
                    Text("Dep").tag(0)
                    Text("Rte").tag(1)
                    Text("Dst").tag(2)
                }
                .pickerStyle(.segmented)
                .font(Font.custom("Helvetica", size: 24))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.cyan, lineWidth: 1))
                .frame(width: UIScreen.main.bounds.width/1.5)
            } else {
                Text("Showing Nearest Airports")
            }
           
        }.onAppear(){
            do {
                locationManager.requestLocation()
            }
        }
        Spacer()
    }
    func convertPositionToString(location: CLLocationCoordinate2D)->String{
        let latitude = Double(location.latitude)
        let longitude = Double(location.longitude)
        
        let latString = (latitude < 0) ? "S" : "N"
        let lonString = (longitude < 0) ? "W" : "E"
        
        let degLat = abs(Int(floor(latitude)))
        let minLat = abs((latitude - floor(latitude)) * 60)
        let degLng = abs(Int(floor(longitude)))
        let minLng = abs((longitude - floor(longitude)) * 60)
        
        return ("\(latString)\(String(format: "%02d", degLat))˚\(String(format: "%.2f", minLat))’ - \(lonString)\(String(format: "%03d", degLng))˚\(String(format: "%.2f", minLng))’")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
