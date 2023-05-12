//
//  clothingItem.swift
//  loph
//
//  Created by 90309356 on 4/12/23.
//

import SwiftUI

class clothingItem : ObservableObject {
    
    
    struct type : Hashable {
        //var category: String
        var image: String
    }
    
    @Published var starting = type(image: "white bird")
    
    //@Published var categories: [String] = ["Red", "Orange", "Yellow", "Green", "Blue", "Pink", "Grey", "Black", "Purple", "Purple Blue"]
    
    @Published var types: [type] = [
        type(image: "red bird"),
        type(image: "orange bird"),
        type(image: "yellow bird"),
        type(image: "green bird"),
        type(image: "blue bird"),
        type(image: "pink bird"),
        type(image: "grey bird"),
        type(image: "black birdpng"),
        type(image: "purple bird"),
        type(image: "purpleBlue")
        
        ]
    
    
    
    
}





