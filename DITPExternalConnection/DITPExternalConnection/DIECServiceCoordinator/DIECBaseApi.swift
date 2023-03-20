//
//  DIECBaseApi.swift
//  DITPExternalConnection
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

internal enum DIECBaseApi: String  {
    case baseApi = "baseApi"
    case baseResource = "baseApiResouce"
    internal var urlString: String {
        guard let path = DIECFrameWorkConfiguration.bundle()?.path(forResource: "infoService", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
              let string = dict[self.rawValue] as? String
        else {
            return ""
        }
        return string
    }
}
