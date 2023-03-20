//
//  EnrollmentInteractor.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation
import DITPEnrollment
import DITPExternalConnection
import FirebaseAuth
import CoreData

public class EnrollmentInteractor: EnrollmentInteractorInputProtocol {
    
    public var presenter: EnrollmentInteractorOutputProtocol?
    
    public func requestloggIn(context: NSManagedObjectContext) {
        //DIELoginManager.loggIn()
        //presenter?.responseloggIn()
    }
    public func requestRegisterUser(withEmail email: String, withPassword password: String, context: NSManagedObjectContext) {
        DIERegisterManager.registerUser(withEmail: email, withPassword: password, handler: { [weak self] dataResponse, errorResponse in
            if dataResponse != nil {
                guard let dataResult = dataResponse as?  AuthDataResult
                else { return }
                let userData = FirebaseUserData(userInfo: dataResult)
                let userInfo = self?.getDiccionaryFrom(userData: userData)
                DIECInternalStoreCoreDataHelper.registerInternalUserInfo(dataUser: userInfo ?? [:], context: context)
                DIELoginManager.loggIn()
                self?.presenter?.responseRegisterUser(dataUser: userData)
            } else {
                guard let error = errorResponse as? NSError,
                      let message = error.userInfo["NSLocalizedDescription"] as? String
                else { return }
                self?.presenter?.resiveResponseMessage(title: "Error", message: message)
            }
        })
    }
    private func getDiccionaryFrom(userData: FirebaseUserData) -> [String : Any] {
        return [ "providerID": userData.providerID ?? "",
                 "uid": userData.uid ?? "",
                 "email": userData.email ?? ""]
    }
}
