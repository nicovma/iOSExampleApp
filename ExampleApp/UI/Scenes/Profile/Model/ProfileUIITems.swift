//
//  ProfileUIITems.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 03/09/2022.
//

import Foundation

struct NameInformation: Decodable {
  let name: String
  let email: String
  let imageUrl: URL
}

struct PhoneInformation: Decodable {
  let number: String
}

enum ProfileUIItem {
    case nameUIItem(NameInformation)
    case phoneUIItem(PhoneInformation)
    case logoutUIItem
}
