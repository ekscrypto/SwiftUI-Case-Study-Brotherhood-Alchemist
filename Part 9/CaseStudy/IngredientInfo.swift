//
//  IngredientInfo.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct IngredientInfo: View {
    let ingredient: Ingredient
    @State var revision: Int = 0
    
    var body: some View {
        Self._printChanges()
        _ = revision
        return Button(action: {
            toggle()
        }) {
            HStack(alignment: .center) {
                Text(ingredient.selected ? "▣" : "□")
                Text(ingredient.name)
            }
        }
        .onReceive(ingredient.$selected) { _ in
            revision += 1
        }
    }
    
    func toggle() {
        ingredient.selected = !ingredient.selected
    }
}
