//
//  Film.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 6.08.2021.
//

import Foundation

struct Film : Codable{
    let title:String
    let year:String
    let imdbId:String
    let type:String
    let poster:String
    private enum CodingKeys:String,CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
        
    }
}
struct Films:Codable{
    let films : [Film]
    
    private enum CodingKeys:String,CodingKey{
        case films = "Search"
        
    }
}
