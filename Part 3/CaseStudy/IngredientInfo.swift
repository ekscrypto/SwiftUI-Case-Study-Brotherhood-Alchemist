//
//  IngredientInfo.swift
//  CaseStudy
//
//  Created by Dave Poirier on 2022-04-18.
//

import SwiftUI

struct IngredientInfo: View {
    let ingredient: Ingredient
    let toggleAction: () -> Bool
    @State var selected: Bool = false
    
    var body: some View {
        Self._printChanges()
        return Button(action: {
            selected = toggleAction()
        }) {
            HStack(alignment: .center) {
                Text(selected ? "▣" : "□")
                Text(ingredient.name)
            }
        }
    }
}
