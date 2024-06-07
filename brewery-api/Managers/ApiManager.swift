//
//  ApiManager.swift
//  brewery-api
//
//  Created by Shi, Simba (Coll) on 04/06/2024.
//

import Foundation

class ApiManager: ObservableObject {
    static let shared = ApiManager()
    
    private init() {}
    
    private let baseURL: String = "https://api.openbrewerydb.org/v1/breweries"
    
    func searchFor(query: String, completion: @escaping ([AutocompleteResult]) -> Void) {
        let query = "/autocomplete?query=\(query)"
        
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data,
                  let results = try? decoder.decode([AutocompleteResult].self, from: data) else {
                print("Error decoding")
                return
            }
            
            completion(results)
        }
        task.resume()
    }
    
    func getBreweryInfo(id: String, completion: @escaping (SingleBreweryInfo) -> Void) {
        let query = "/\(id)"
        
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            let decoder = JSONDecoder()
            print(data)
            
            guard let data = data,
                  let result = try? decoder.decode(SingleBreweryInfo.self, from: data) else {
                print("Error decoding response")
                return
            }
            
            completion(result)
        }
        task.resume()
    }
}
