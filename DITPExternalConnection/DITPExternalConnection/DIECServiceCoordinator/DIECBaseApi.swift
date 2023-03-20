//
//  DIECBaseApi.swift
//  DITPExternalConnection
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

public enum DIECBaseApi: String  {
    case baseApi = "baseApi"
    case baseResource = "baseApiResouce"
    
    var urlString: String {
        guard let string = Bundle.main.object(forInfoDictionaryKey: self.rawValue) as? String
        else {
            return ""
        }
        return string
    }
}
