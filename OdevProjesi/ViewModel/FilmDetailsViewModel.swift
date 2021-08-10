//
//  FilmDetailsViewModel.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 8.08.2021.
//

import Foundation
struct FilmDetailViewModel{
    let filmDetails:FilmDetails
}

struct FilmDetailsViewModel{
    let detail : FilmDetails
    
    var title:String{
        detail.title
    }
    var actor:String{
        detail.actors
    }
    var imdbID:String{
        detail.imdbId
    }
    var imdbRating:String{
        detail.imdbRating
    }
    var poster:String{
        detail.poster
    }
    var plot:String{
        detail.plot
    }
    
}
