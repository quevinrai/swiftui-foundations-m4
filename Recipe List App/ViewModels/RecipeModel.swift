//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 3/13/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        /* let service = DataService()
        self.recipes = service.getLocalData() */
        
        self.recipes = DataService.getLocalData()
        
        // Set the recipes property
    }
}
