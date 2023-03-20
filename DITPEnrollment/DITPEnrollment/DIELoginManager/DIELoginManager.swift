//
//  DIELoginManager.swift
//  DITPEnrollment
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import DITPExternalConnection
import FirebaseAuth

public class DIELoginManager {
    
    private static var userDefaults: UserDefaults = UserDefaults.standard
    
    private static func saveObject(withKey key: String, object: Any ) {
        userDefaults.set(object, forKey: key)
    }
    private static func recoverObject(withKey key: String) -> Any? {
        let object = userDefaults.value(forKey: key)
        return object
    }
    
    public static func loggIn() {
        saveObject(withKey: "DIELoginKey", object: true)
    }
    public static func loggOut() {
        saveObject(withKey: "DIELoginKey", object: false)
    }
    public static func isLoggin() -> Bool {
        guard let logginState = recoverObject(withKey: "DIELoginKey") as? Bool
        else {
            return false
        }
        return logginState
    }
    
}
