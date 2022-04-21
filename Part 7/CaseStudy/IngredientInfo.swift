//
//  IngredientInfo.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct IngredientInfo: View {
    let ingredient: Ingredient
    @ObservedObject var selected: Selected
    
    private var isSelected: Bool {
        selected.ingredients.contains(ingredient.id)
    }
    
    var body: some View {
        Self._printChanges()
        return Button(action: {
            toggle()
        }) {
            HStack(alignment: .center) {
                Text(isSelected ? "▣" : "□")
                Text(ingredient.name)
            }
        }
    }
    
    func toggle() {
        if let index = selected.ingredients.firstIndex(of: ingredient.id) {
            selected.ingredients.remove(at: index)
        } else {
            selected.ingredients.append(ingredient.id)
        }
    }
}
