//
//  HomeViewModel.swift
//  Weather Info
//
//  Created by Izak on 16/3/22.
//

import Foundation
import Combine


class HomeViewModel{
    
    private var subscribers = Set<AnyCancellable>()

    @Published var districtList:[District] = []
    
    func getDistrictList() {
        APIManager.shared.getData(endPoint: HomeEndPoint.getDistricts, resultType: DistrictResponseModel.self)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Successfully getDistrictList API call finished")
                }
            } receiveValue: { result in
                guard let districts = result.data else {
                    showAlert(message: "Unable to find districts info from API!")
                    return
                }
                self.districtList = districts
            }.store(in: &subscribers)

    }
    
    @Published var currentWeatherInfo:WeatherResponseModel?
    
    func getWeatherInfo(lat:String, lon:String) {
        APIManager.shared.getData(endPoint: HomeEndPoint.getWeatherInfo(lat: lat, lon: lon), resultType: WeatherResponseModel.self)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Successfully getWeatherInfo API call finished")
                }
            } receiveValue: { result in
                self.currentWeatherInfo = result
            }.store(in: &subscribers)

    }
}
