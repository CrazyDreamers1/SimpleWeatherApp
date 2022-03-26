//
//  String+Extension.swift
//  Weather Info
//
//  Created by Izak on 17/3/22.
//

import Foundation

extension String{
    func tempurature() -> String {
        let kelvin = Double(self)!
        let celcius = kelvin - 273.15
        let celciusStr = String(format: "%.2f", celcius)
        return "\(celciusStr)º c"
    }
    
    func makeCoordinate() -> (lat:String,lon:String) {
        let coordinates = self.components(separatedBy: ", ")
        return (coordinates.first ?? "",coordinates.last ?? "")
    }
    
}
