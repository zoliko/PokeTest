//
//  EnrollmentInteractor.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 19/03/23.
//

import Foundation

public class EnrollmentInteractor: EnrollmentInteractorInputProtocol {
    public var presenter: EnrollmentInteractorOutputProtocol?
    public func sendRequestMessage() {
        presenter?.resiveResponseMessage()
    }
}
