//
//  clothingItem.swift
//  loph
//
//  Created by 90309356 on 4/12/23.
//

import SwiftUI

class clothingItem : ObservableObject {
    
    
    struct type : Hashable {
        var category: String
        var image: String
    }
    
    @Published var starting = type(category: "white", image: "white bird")
    
    @Published var categories: [String] = ["Red", "Orange", "Yellow", "Green", "Blue", "Pink", "Grey", "Black", "Purple", "Purple Blue"]
    
    @Published var types: [type] = [
        type(category: "Red", image: "red bird"),
        type(category: "Orange", image: "orange bird"),
        type(category: "Yellow", image: "yellow bird"),
        type(category: "Green", image: "green bird"),
        type(category: "Blue", image: "blue bird"),
        type(category: "Pink", image: "pink bird"),
        type(category: "Grey", image: "grey bird"),
        type(category: "Black", image: "black birdpng"),
        type(category: "Purple", image: "purple bird"),
        type(category: "Purple Blue", image: "purpleBlue")
        
        ]
    
    
    
    
}





