//
//  DIECServiceCoordinator.swift
//  DITPExternalConnection
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

public typealias DIECServiceHandler = (_ data: Any?, _ service: URLResponse?, _ error: Error?) -> Void

public class DIECServiceCoordinator {
    
    static let baseAPi = DIECBaseApi.baseApi.urlString
    public static func getService<T: Decodable>(endPoint: String,
                                                structureType: T.Type,
                                                handler: @escaping DIECServiceHandler ) {
        
        let urlService = "\(baseAPi)\(endPoint)"
        guard let url = URL(string: urlService)
        else {
            handler(nil, nil, nil)
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { dataResponse, serviceResponse, errorResponse in
            DispatchQueue.main.async {
                guard let data = dataResponse,
                      let objectResponse = decodeJsonDataTo(object: structureType, with: data)
                else {
                    guard let objectString = DIECInternalStoreHelper.recoverObjectInString(withKey: "keyInternalStore/\(endPoint)"),
                          let data =  objectString.data(using: .utf8),
                          let objectResponse = decodeJsonDataTo(object: structureType, with: data)
                    else {
                         handler(nil,serviceResponse,errorResponse)
                         return
                    }
                    handler(objectResponse, nil, nil)
                    return
                }
                handler(objectResponse, serviceResponse, nil)
                return
            }
        }).resume()
    }
    
    public static func decodeJsonDataTo<T: Decodable>(object structureType: T.Type, with infoData: Data ) -> Any? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(structureType, from: infoData)
    }
    
    
    
}

