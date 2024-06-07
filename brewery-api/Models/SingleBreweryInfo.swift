//
//  SingleBreweryInfo.swift
//  brewery-api
//
//  Created by Shi, Simba (Coll) on 04/06/2024.
//

import Foundation

struct SingleBreweryInfo: Codable {
    let id: String
    let name: String
    let brewery_type: String
    let address_1: String
    let address_2: String?
    let address_3: String?
    let city: String
    let state_province: String
    let postal_code: String
    let country: String
    let longitude: String
    let latitude: String
    let phone: String
    let website_url: String
    let state: String
    let street: String
    
//    "id": "b54b16e1-ac3b-4bff-a11f-f7ae9ddc27e0",
//        "name": "MadTree Brewing 2.0",
//        "brewery_type": "regional",
//        "address_1": "5164 Kennedy Ave",
//        "address_2": null,
//        "address_3": null,
//        "city": "Cincinnati",
//        "state_province": "Ohio",
//        "postal_code": "45213",
//        "country": "United States",
//        "longitude": "-84.4137736",
//        "latitude": "39.1885752",
//        "phone": "5138368733",
//        "website_url": "http://www.madtreebrewing.com",
//        "state": "Ohio",
//        "street": "5164 Kennedy Ave"
}
