//
//  Array+Unique.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 13/09/2022.
//

import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
