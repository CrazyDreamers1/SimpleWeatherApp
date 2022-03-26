//
//  APIEndpoints.swift
//  LovFresh
//
//  Created by Izak on 25/11/21.
//

import Foundation
import Alamofire


//MARK: - Home EndPoints
enum HomeEndPoint: Endpoint {
    
    case getDistricts
    case getWeatherInfo(lat:String, lon:String)

    
    var method: HTTPMethod {
        switch self {
        case .getDistricts, .getWeatherInfo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getDistricts:
            return AppUrl.getBdDistrictList
        case .getWeatherInfo(let lat, let lon):
            return AppUrl.getWeatherInfo+"?lat=\(lat)&lon=\(lon)&appid=\(AppConstant.shared.OPEN_WEATHER_API_KEY)"
        }
    }
    
    var query: [String: Any]?  {
        switch self {
        case .getDistricts, .getWeatherInfo:
            return nil
        }
    }
}
