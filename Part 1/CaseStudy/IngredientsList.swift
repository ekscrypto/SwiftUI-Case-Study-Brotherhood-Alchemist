//
//  IngredientsList.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct IngredientsList: View {
    let ingredients: [Ingredient]
    @Binding var selected: [UUID]
    
    var body: some View {
        Self._printChanges()
        return VStack(alignment: .leading) {
            Text("Ingredients")
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(ingredients) { ingredient in
                        Button(action: {
                            toggle(ingredient: ingredient)
                        }) {
                            IngredientInfo(
                                ingredient: ingredient,
                                selected: selected.contains(ingredient.id))
                        }
                    }
                }
            }
        }.padding([.leading, .trailing])
    }
    
    private func toggle(ingredient: Ingredient) {
        if let index = selected.firstIndex(of: ingredient.id) {
            selected.remove(at: index)
        } else {
            selected.append(ingredient.id)
        }
    }
}

