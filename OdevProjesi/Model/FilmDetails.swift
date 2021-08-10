//
//  FilmDetails.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 8.08.2021.
//

import Foundation

struct FilmDetails:Codable{
    let title:String
    let director:String
    let actors:String
    let plot:String
    let poster:String
    let imdbRating:String
    let imdbId:String
    
    private enum CodingKeys : String,CodingKey{
        
        case title = "Title"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
        
    }
    
    
}
