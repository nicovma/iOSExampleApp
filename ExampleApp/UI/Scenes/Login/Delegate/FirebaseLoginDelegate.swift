//
//  FirebaseLoginDelegate.swift
//  OverInventoy
//
//  Created by Nico Valentini Mac Adden on 09/12/2021.
//

import Foundation

protocol FirebaseLoginDelegate: class {
    func loginSuccess()
    func loginFinishedWithError(msg: String)
}
