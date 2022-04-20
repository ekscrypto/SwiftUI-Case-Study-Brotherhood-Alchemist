//
//  IngredientInfo.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct IngredientInfo: View {
    let ingredient: Ingredient
    let selected: Bool
    
    var body: some View {
        Self._printChanges()
        return HStack(alignment: .center) {
            Text(selected ? "▣" : "□")
            Text(ingredient.name)
        }
    }
}
