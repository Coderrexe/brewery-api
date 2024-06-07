//
//  ContentView.swift
//  brewery-api
//
//  Created by Shi, Simba (Coll) on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var search: String = ""
    
    @State private var results: [AutocompleteResult] = []
    
    @ObservedObject var apiManager = ApiManager.shared
    
    var body: some View {
        NavigationStack {
            TextField("Enter a search item", text: $search)
                .onChange(of: search) { oldValue, newValue in
                    print("New value is: \(newValue)")
                    apiManager.searchFor(query: newValue) { results in
                        self.results = results
                    }
                }
            
            Text("Api Results: ")
            
            List {
                ForEach(results, id: \.id) {result in
                    NavigationLink(result.name) {
                        BreweryDetailsView(breweryId: result.id)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
