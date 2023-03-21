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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
            
    }
}
