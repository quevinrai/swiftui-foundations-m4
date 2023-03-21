//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 3/20/23.
//

import SwiftUI

struct RecipeListView: View {
    
    //@ObservedObject var model = RecipeModel()
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .padding(.top, 40)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    
                                    // MARK: Row item
                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        Text(r.name)
                                            .foregroundColor(.black)
                                    }
                                    
                                })
                        }
                    }
                }
            }
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
        
    }
}
