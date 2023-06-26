//
//  recipeModel.swift
//  recipeList
//
//  Created by david on 22/06/23.
//

import Foundation

struct Recipe:Hashable,Codable{
   
    let name:String
    let imageUrl:String
    let description:String
    let location:Coordinates
}

struct Coordinates: Hashable,Codable{
    let lat: Double
    let lng: Double
}
