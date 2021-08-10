//
//  FilmViewModel.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 7.08.2021.
//

import Foundation
struct FilmTableViewModel{
   // var filmsArray = [Film]()
    let filmsArray:[Film]
    
    func numberOfRowSection()->Int{
        return filmsArray.count
    }
    func filmAtIndexPath(_ index:Int)->FilmViewModel{
        let films = self.filmsArray[index]
        return FilmViewModel(film: films)
    }
}
struct FilmViewModel{
    let film : Film
    
    var title:String{
        film.title
    }
    var year:String{
        film.year
    }
    var imdbID:String{
        film.imdbId
    }
    var poster:String{
        film.poster
    }
    var type:String{
        film.type
    }
}
