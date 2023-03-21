//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 3/14/23.
//

import SwiftUI

struct RecipeDetailView: View {
//    @EnvironmentObject var model:RecipeModel
    @State var selectedServingSize = 2
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
//                Text(recipe.name)
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
//        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
            .environmentObject(RecipeModel())
    }
}
