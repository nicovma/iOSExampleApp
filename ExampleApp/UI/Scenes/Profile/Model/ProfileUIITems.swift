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

struct ProfileOptionInformation: Decodable {
  let title: String
  let image: String
  let type: OptionType
}

enum ProfileUIItem {
    case nameUIItem(NameInformation)
    case optionUIItem(ProfileOptionInformation)
}

enum OptionType : Decodable {
    case logout, privacy, termsAndConditions
}
