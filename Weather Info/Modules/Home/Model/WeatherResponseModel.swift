//
//  WeatherResponseModel.swift
//  Weather Info
//
//  Created by Izak on 16/3/22.
//

import Foundation


struct WeatherResponseModel: Codable, CustomStringConvertible {
    var description: String{
        return ""
    }
    var weather:[Weather]?
    var main:MainContent?
    
    enum CodingKeys: String, CodingKey {
        case weather
        case main
        
    }
}

struct Weather: Codable, CustomStringConvertible {
    var description: String{
        return ""
    }
    var main:String?
    var des:String?
    var icon:String?

    enum CodingKeys: String, CodingKey {
        case main
        case des = "description"
        case icon
        
    }
}

struct MainContent: Codable, CustomStringConvertible {
    var description: String{
        return ""
    }
    var temp:Double?
    var temp_min:Double?
    var temp_max:Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case temp_min
        case temp_max
        
    }
}

struct Sys: Codable, CustomStringConvertible {
    var description: String{
        return ""
    }
    var sunrise:Int?
    var sunset:Int?
    
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
    }
}

