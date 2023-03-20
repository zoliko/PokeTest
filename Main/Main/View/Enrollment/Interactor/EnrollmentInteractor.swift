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
    
    public func requestloggIn(withEmail email: String, withPassword password: String, context: NSManagedObjectContext) {
        DIERegisterManager.logginUser(withEmail: email, withPassword: password, handler: { [weak self] dataResponse, errorResponse in
            DIELoginManager.loggOut()
            if dataResponse != nil {
                self?.starlogginProcess(dataResult: dataResponse, context: context)
            } else {
                self?.sendErrorMessage(errorResponse: errorResponse, context: context)
            }
        })
    }
    public func requestRegisterUser(withEmail email: String, withPassword password: String, context: NSManagedObjectContext) {
        DIERegisterManager.registerUser(withEmail: email, withPassword: password, handler: { [weak self] dataResponse, errorResponse in
            DIELoginManager.loggOut()
            if dataResponse != nil {
                self?.starlogginProcess(dataResult: dataResponse, context: context)
            } else {
                self?.sendErrorMessage(errorResponse: errorResponse, context: context)
            }
        })
    }
    private func getDiccionaryFrom(userData: FirebaseUserData) -> [String : Any] {
        return [ "providerID": userData.providerID ?? "",
                 "uid": userData.uid ?? "",
                 "email": userData.email ?? ""]
    }
    
    private func starlogginProcess(dataResult: Any?, context: NSManagedObjectContext) {
        guard let dataResult = dataResult as?  AuthDataResult else { return }
        let userData = FirebaseUserData(userInfo: dataResult)
        let userInfo = getDiccionaryFrom(userData: userData)
        DIECInternalStoreCoreDataHelper.registerInternalUserInfo(dataUser: userInfo, context: context)
        DIELoginManager.loggIn()
        presenter?.responseRegisterUser(dataUser: userData)
    }
    
    private func sendErrorMessage(errorResponse: Any?, context: NSManagedObjectContext) {
        guard let error = errorResponse as? NSError,
              let message = error.userInfo["NSLocalizedDescription"] as? String
        else { return }
        presenter?.resiveResponseMessage(title: "Error", message: message)
    }
}
