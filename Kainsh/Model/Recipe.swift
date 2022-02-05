//
//  Recipe.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

class RecipeDataModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func getData() {
        guard let data = readLocalFile(forName: "recipe") else {
            return
        }
        
        parse(jsonData: data)
        
        
//        recipes = Bundle.main.decode([Recipe].self, from: "recipe.json")
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) {
        do {
            self.recipes = try JSONDecoder().decode([Recipe].self,
                                                       from: jsonData)
    
            print("===================================")
        } catch {
            print("decode error")
        }
    }
    
    init() {
        getData()
    }
}




struct Recipe: Decodable, Identifiable {
    var id: UUID = UUID()
    
    let name: String
    let ingredients: [Ingredient]
    let steps: [String]
    let timers: [Int]
    let imageURL: String?
    let originalURL: String?
    
    enum RecipeKeys: CodingKey {
    
        case name
        case ingredients
        case steps
        case timers
        case imageURL
        case originalURL
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: RecipeKeys.self)
        
        self.name = try value.decode(String.self, forKey: .name)
        self.ingredients = try value.decode([Ingredient].self, forKey: .ingredients)
        self.steps = try value.decode([String].self, forKey: .steps)
        self.timers = try value.decode([Int].self, forKey: .timers)
        self.imageURL = try value.decodeIfPresent(String.self, forKey: .imageURL)
        self.originalURL = try value.decodeIfPresent(String.self, forKey: .originalURL)
        
    }
}

struct Ingredient: Decodable {
    let quantity: String
    let name: String
    let type: String
}
