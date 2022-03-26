//
//  DistrictResponseModel.swift
//  Weather Info
//
//  Created by Izak on 16/3/22.
//

import Foundation


struct DistrictResponseModel: Codable, CustomStringConvertible {
    var description: String{
        return ""
    }
    var data:[District]?
    
    enum CodingKeys: String, CodingKey {
        case data
        
    }
}

struct District: Codable, CustomStringConvertible {
    var description: String{
        return ""
    }
    
    var _id: String?
    var district:String?
    var districtbn: String?
    var coordinates:String?
    
    enum CodingKeys: String, CodingKey {
        case _id
        case district
        case districtbn
        case coordinates
    }
}

extension District{
    func getName() -> String {
        return "\(district ?? "") - \(districtbn ?? "")"
    }
    func districtDescription() -> String {
        return "\(district ?? "Dhaka")-\(districtbn ?? "") is one of the 64 districts in Bangladesh, each further subdivided into upazila (subdistricts) or thana. The area within each police station, except for those in metropolitan areas, is divided into several unions, with each union consisting of multiple villages. In the metropolitan areas, police stations are divided into wards, further divided into mahallas.\n\nThere are no elected officials at the divisional or district levels, and the administration is composed only of government officials. Direct elections are held in each union (or ward) for a chairperson and a number of members. In 1997, a parliamentary act was passed to reserve three seats (out of 12) in every union for female candidates"
    }

}
