//
//  ShowPosition.swift
//  wx
//
//  Created by Tomasz Zuczek on 19/06/2022.
//

import Foundation
import CoreLocation

class ShowPosition{
    @Published var lat: String? = nil
    @Published var lng: String? = nil
    
    func setPosition(position: CLLocationCoordinate2D?){
        var northSouth = ""
        var eastWest = ""
        if let currentPosition = position{
            if currentPosition.latitude > 0{
                northSouth = "N"
            }else{
                northSouth = "S"
            }
            if currentPosition.longitude > 0{
                eastWest = "E"
            }else{
                eastWest = "W"
            }
        }
    }
}
