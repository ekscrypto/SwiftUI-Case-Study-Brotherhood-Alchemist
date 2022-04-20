//
//  IngredientInfo.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct IngredientInfo: View {
    let ingredient: Ingredient
    @Binding var selected: [UUID]
    
    var body: some View {
        Self._printChanges()
        return Button(action: {
            toggle(ingredient: ingredient)
        }) {
            HStack(alignment: .center) {
                Text(selected.contains(ingredient.id) ? "▣" : "□")
                Text(ingredient.name)
            }
        }
    }
    
    private func toggle(ingredient: Ingredient) {
        if let index = selected.firstIndex(of: ingredient.id) {
            selected.remove(at: index)
        } else {
            selected.append(ingredient.id)
        }
    }
}
