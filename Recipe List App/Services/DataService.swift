//
//  DataService.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 3/13/23.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        /* PARSE LOCAL JSON FILE */
        
        // 1. Get a URL path to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // 2. Create a URL object
        let url = URL(filePath: pathString!)
        
        do {
            // 3. Create a data object
            let data = try Data(contentsOf: url)
    
            // 4. Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // 5. Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // 6. Return the recipes
                return recipeData
            } catch {
                // Error with parsing JSON
                print(error)
            }
            
            
        } catch {
            // Error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}
