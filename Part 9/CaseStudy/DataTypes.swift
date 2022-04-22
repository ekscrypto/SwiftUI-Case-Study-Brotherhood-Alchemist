//
//  DataTypes.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import Foundation

class Ingredient: Identifiable {
    let id: UUID = .init()
    let name: String
    @Published var selected: Bool = false
    
    init(name providedName: String) {
        name = providedName
    }
}

struct Effect: Identifiable {
    let id: UUID = .init()
    let name: String
}
