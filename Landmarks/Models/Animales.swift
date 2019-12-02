/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import Combine

struct Animal: Hashable, Codable, Identifiable {
    var id: Int
    var nombre: String
    var descripcion: String
    var imagen: String
}

final class AnimalFacade: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var animales = [Animal]()
    
    init() {
        load()
    }
    
    func load() {
            let url = URL(string: "http://192.168.183.32:8080/Animales/webresources/database.tbtipo")!
        
            URLSession.shared.dataTask(with: url) {(data,response,error) in
                do {
                    if let d = data {
                        let decodedLists = try JSONDecoder().decode([Animal].self, from: d)
                        print(decodedLists)
                        DispatchQueue.main.async {
                            self.animales = decodedLists
                        }
                    }else {
                        print("No Data")
                    }
                } catch {
                    print ("Error")
                }
                
            }.resume()
    }
}

