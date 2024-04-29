//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/27/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class RecipeViewModel : ObservableObject {
    
    @Published private(set) var recipes = [RecipeModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.recipes.removeAll()
        db.collection("recipes")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.recipes.append(try document.data(as: RecipeModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }}
    }
    
    func saveData(newRecipe: RecipeModel) {
        var ref: DocumentReference? = nil
        ref = db.collection("recipes").addDocument(data: [
            "name": newRecipe.name,
            "image": newRecipe.image,
            "description": newRecipe.description,
            "ingredients": newRecipe.ingredients,
            "directions": newRecipe.directions,
            "category": newRecipe.category
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
