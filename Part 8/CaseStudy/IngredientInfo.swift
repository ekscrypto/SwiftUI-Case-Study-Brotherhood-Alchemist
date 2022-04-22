//
//  IngredientInfo.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct IngredientInfo: View {
    let ingredient: Ingredient
    let selected: Selected
    
    @State var isSelected: Bool = false
    
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
        .onReceive(selected.$ingredients) { selectedIngredients in
            let updatedSelection = selectedIngredients.contains(ingredient.id)
            if isSelected != updatedSelection {
                isSelected = updatedSelection
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
