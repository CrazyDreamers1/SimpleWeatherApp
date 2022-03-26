//
//  Service.swift
//  TokenHandleDemo
//
//  Created by CodeCat15 on 8/2/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
struct AppUrl {

    private struct Domains {
        //BD Info domain
        static let BDInfo = "https://bdapis.herokuapp.com"
        
        //OpenWeather domain
        static let OpenWeather = "https://api.openweathermap.org"//

    }
    private  struct Routes {
        static let BDInfo = "/api/"
        static let OpenWeather = "/data/"
    }
    private  struct Version {
       static let BDInfo = "v1.1/"
        static let OpenWeather = "2.5/"
    }


    private  static let BDInfoDomain = Domains.BDInfo
    private  static let BDInfoRoute = Routes.BDInfo
    private static let BDInfoVersion = Version.BDInfo
    
    private  static let OWDomain = Domains.OpenWeather
    private  static let OWRoute = Routes.OpenWeather
    private static let OWVersion = Version.OpenWeather

    
    private  static let BDInfoBaseURL = BDInfoDomain + BDInfoRoute + BDInfoVersion
    private  static let OWBaseURL = OWDomain + OWRoute + OWVersion
    
    

    
    static var getWeatherInfo: String{
        return OWBaseURL + "weather"
    }
    
    static var getBdDistrictList: String{
        return BDInfoBaseURL + "districts"
    }

    
}

