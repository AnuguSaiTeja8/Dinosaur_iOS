//
//  DinosaurListViewModel.swift
//  Ratnakar_IOS
//
//  Created by MahipalReddy on 18/06/24.
//

import Foundation
import UIKit

class DinosaurListViewModel {
    var listOfDinosaurs: [DinosaurList] = []
    
    init(listOfDinosaurs: [DinosaurList]? = nil ) {
        self.listOfDinosaurs = listOfDinosaurs ?? []
        fetchDinosaurList()
    }
    
    func fetchDinosaurList() {
        
        let url = URL(string: "https://mocki.io/v1/c3dcf2be-2131-4024-89ca-40d211b5b60c")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    self.listOfDinosaurs = try JSONDecoder().decode([DinosaurList].self, from: data)
                    print(self.listOfDinosaurs, "Dinosaur data fetched successfully")
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                }
            }
            }
            task.resume()
        }
    

    }
