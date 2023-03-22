//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 3/20/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    // @ObservedObject var model = RecipeModel()
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    
                    // Loop through each recipe
                    ForEach(0..<model.recipes.count, id: \.self) { index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured {
                            
                            // Recipe button
                            Button(action: {
                                // Show the detail recipe sheet
                                self.isDetailViewShowing = true
                            }, label: {
                                // Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show the Recipe Detail View
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
//                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        // Find the index of first recipe that is featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
