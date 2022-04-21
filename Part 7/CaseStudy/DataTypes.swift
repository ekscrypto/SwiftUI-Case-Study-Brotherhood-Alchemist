//
//  DataTypes.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import Foundation

struct Ingredient: Identifiable {
    let id: UUID = .init()
    let name: String
}

struct Effect: Identifiable {
    let id: UUID = .init()
    let name: String
}

class Selected: ObservableObject {
    @Published var ingredients: [UUID] = []
}
