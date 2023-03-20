//
//  DIECInternalStoreHelper.swift
//  DITPExternalConnection
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import Foundation

public class DIECInternalStoreHelper {
    
    private static var userDefaults: UserDefaults = UserDefaults.standard
    public static func saveObject(withKey key: String, object: ModelsResponseUtils ) {
        let objectJsonString = object.convertToJsonString()
        userDefaults.set(objectJsonString, forKey: key)
    }
    public static func recoverObjectInString(withKey key: String) -> String? {
        guard let serviceResponceString = userDefaults.value(forKey: key) as? String
        else {
            return nil
        }
        return serviceResponceString
    }
}
