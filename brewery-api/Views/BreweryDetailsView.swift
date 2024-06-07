//
//  BreweryDetailsView.swift
//  brewery-api
//
//  Created by Shi, Simba (Coll) on 04/06/2024.
//

import SwiftUI

struct BreweryDetailsView: View {
    @State var breweryId: String
    
    @State var result: SingleBreweryInfo?
    
    @ObservedObject var apiManager = ApiManager.shared
    
    var body: some View {
        Text("This is brewery \(breweryId)")
            .onAppear {
                print("getting api details for \(breweryId)")
                apiManager.getBreweryInfo(id: breweryId) { result in
                    self.result = result
                }
                
                
                // create a new method in api manager
                // call the single brewery endpoint using this view's brewery id
                // create a new brewery model
                // display the details of the returned brewery object
                
                // help:
                // remember that you can search for the endpoints in the web browser to see what properties each brewery object has
            }
        VStack {
            if let result = result {
//                Text(result.name)
//                Text(result.brewery_type)
                Text(result.address_1)
            }
        }
    }
}

//#Preview {
//    BreweryDetailsView(breweryId: "abc")
//}
