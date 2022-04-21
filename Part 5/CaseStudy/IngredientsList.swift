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
    @State var filter: String = ""
    
    private var filteredIngredients: [Ingredient] {
        if filter.isEmpty {
            return ingredients
        }
        let lowercasedFilter = filter.lowercased()
        return ingredients.filter({ $0.name.lowercased().contains(lowercasedFilter) })
    }
    
    var body: some View {
        Self._printChanges()
        return VStack(alignment: .leading) {
            Text("Ingredients")
            TextField("Filter…", text: $filter)
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(filteredIngredients) { ingredient in
                        IngredientInfo(
                            ingredient: ingredient,
                            toggleAction: { toggle(ingredient: ingredient) })
                    }
                }
            }
        }.padding([.leading, .trailing])
    }
    
    private func toggle(ingredient: Ingredient) -> Bool {
        if let index = selected.firstIndex(of: ingredient.id) {
            selected.remove(at: index)
            return false
        }
        
        selected.append(ingredient.id)
        return true
    }
}

