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
                        IngredientInfo(
                            ingredient: ingredient,
                            selected: _selected)
                    }
                }
            }
        }.padding([.leading, .trailing])
    }
}

