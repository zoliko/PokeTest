//
//  DIECModelsResponseUtils.swift
//  DITPExternalConnection
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import Foundation

public protocol ModelsResponseUtils: Codable, Decodable {
 
}

public extension ModelsResponseUtils {
    
    init<T: Decodable>(jsonString: String?, type: T.Type ) throws {
        self = try! DIECServiceCoordinator.decodeJsonDataTo(object: type, with: jsonString?.data(using: .utf8) ?? Data()) as! Self 
    }
    
    func convertToJsonString() -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let jsonData = (try? encoder.encode(self)) ?? Data()
        return String(data: jsonData, encoding: .utf8)
    }
}
