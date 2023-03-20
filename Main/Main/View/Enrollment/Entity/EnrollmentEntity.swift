//
//  EnrollmentEntity.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import FirebaseAuth

public struct FirebaseUserData {
    var providerID: String?
    var uid: String?
    var email: String?
    var displayName: String?
    
    init(userInfo: AuthDataResult) {
        self.email = userInfo.user.email
        self.displayName = userInfo.user.displayName
        self.providerID = userInfo.user.providerID
        self.uid = userInfo.user.uid
    }
}
