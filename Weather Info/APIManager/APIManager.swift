//
//  NetworkManager.swift
//  LovFresh
//
//  Created by Izak on 25/11/21.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine


@available(iOS 13.0, *)
class APIManager{
    private init() {}
    static let shared:APIManager = APIManager()
    
    private var subscribers = Set<AnyCancellable>()
    
    @available(iOS 13.0, *)
    func getData<T:Decodable>(endPoint: Endpoint, resultType: T.Type) -> Future<T,Error> {
        
        return Future <T,Error> {[weak self] promise in
            if Connectivity.isConnectedToInternet {
                print("Network Connected")
                showHud()
                let headers = self?.getDefaultHeaders()
                print("headers ->\n \(headers ?? HTTPHeaders())")
                print(endPoint.path)
                print("Parameters: \(endPoint.query ?? [:] )")
                print("Method:\(endPoint.method)")
                
                AF.request(endPoint.path,method: endPoint.method,parameters: endPoint.query, encoding:JSONEncoding.default, headers: headers)
                    .validate(statusCode: 200...299)
                    .publishDecodable(type: T.self)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .finished :
                            print("Successfully Finished")
                            hideHud()
                        case .failure(let error):
                            promise(.failure(NetworkError.unknown))
                            print(error.localizedDescription)
                            hideHud()
                        }
                    }, receiveValue: { (response) in
                        switch response.result{
                        case .success(let model):
                            promise(.success(model))
                        case .failure(let error):
                            promise(.failure(error.localizedDescription))
                        }
                    })
                    .store(in: &self!.subscribers)
                
            }else {
                print(NetworkError.networkConnection.errorDescription ?? "Network error")
                hideHud()
                showAlert(message: NetworkError.networkConnection.errorDescription ?? "Network error")
                return promise(.failure(NetworkError.networkConnection))

            }
        }
    }
    
    
    
    func getDefaultHeaders() -> HTTPHeaders{
        var headers: HTTPHeaders?
        
        headers = [
            "Authorization": "",
            "Content-Type":"application/json"
        ]
        
        return headers!
    }

}


enum NetworkError: Error {
    case networkConnection
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .networkConnection:
            return NSLocalizedString("Network isn't Connected", comment: "Network isn't Connected")
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}

// MARK: - Error Handling
extension String: Error {}
extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
