//
//  ContentView.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct ContentView: View {
    let ingredients: [Ingredient] = [
        Ingredient(name: "Nirnroot"),
        Ingredient(name: "Spider egg"),
        Ingredient(name: "Taproot")
    ]
    
    let selectedIngredients: Selected = .init()
    
    var body: some View {
        Self._printChanges()
        return GeometryReader { reader in
            HStack(alignment: .top) {
                IngredientsList(
                    ingredients: ingredients,
                    selected: selectedIngredients)
                .frame(width: reader.size.width * 0.33)
                
                Text("Placeholder for recipes")
                    .frame(width: reader.size.width * 0.33)
                
                Text("Placeholder for effects")
                    .frame(width: reader.size.width * 0.33)
            }
        }
        .frame(maxWidth: .infinity)
    }

}
