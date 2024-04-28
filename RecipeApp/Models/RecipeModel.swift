//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/27/24.
//

import Foundation
import FirebaseFirestoreSwift

enum Category: String {
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct RecipeModel: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var image: String
    var description: String
    var ingredients: [String]
    var directions: [String]
    var category: Category.RawValue
}
