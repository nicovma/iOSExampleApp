//
//  HomeUIItem.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 06/09/2022.
//

import Foundation

//struct NameInformation: Decodable {
//  let name: String
//  let email: String
//  let imageUrl: URL
//}
//
struct NotTaskInformation: Decodable {
  let title: String
  let notTaskType: NotTaskType
}

enum HomeUIItem {
    case noTask(NotTaskInformation)
}

enum NotTaskType: Decodable {
    case createGroup
    case joinToGroup
}
