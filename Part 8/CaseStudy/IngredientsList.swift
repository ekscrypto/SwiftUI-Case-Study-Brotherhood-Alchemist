//
//  IngredientsList.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct IngredientsList: View {
    let ingredients: [Ingredient]
    let selected: Selected
    
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
            HStack {
                Text("Ingredients")
                Spacer()
                Button(action: {
                    resetAllIngredients()
                }) {
                    Text("RESET")
                }
            }
            TextField("Filter…", text: $filter)
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(filteredIngredients) { ingredient in
                        IngredientInfo(
                            ingredient: ingredient,
                            selected: selected)
                    }
                }
            }
        }.padding([.leading, .trailing])
    }
        
    private func resetAllIngredients() {
        selected.ingredients.removeAll()
    }
}

