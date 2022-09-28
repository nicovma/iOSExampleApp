//
//  SelectTeamUIItem.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 28/09/2022.
//

import Foundation

enum SelectTeamUIItem{
    case team(SelectTeam)
}

struct SelectTeam: Decodable, Encodable {
  let name: String
  let image: String
  let code: Int
}
