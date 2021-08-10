//
//  DownloadFilmsData.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 6.08.2021.
//

import Foundation
class DownloadFilmsData{
func downloadFilms(search:String,completion:@escaping(Result<[Film]?,DownloadError>) -> Void){
    guard let url=URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=44695f48")else {
        return completion(.failure(.wrongUrl))
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data=data,error==nil else{
            return completion(.failure(.dataNotCome))
        }
        guard let filmResponse = try? JSONDecoder().decode(Films.self, from: data) else{
            return completion(.failure(.dataNotProcessed))
        }
        completion(.success(filmResponse.films))
    }.resume()
}
func downloadFilmDetails(imdbId:String,completion:@escaping(Result<FilmDetails,DownloadError>) -> Void){
        guard let url=URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=44695f48")else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data=data,error==nil else{
                return completion(.failure(.dataNotCome))
            }
            guard let filmDetailsResponse = try? JSONDecoder().decode(FilmDetails.self, from: data) else{
                return completion(.failure(.dataNotProcessed))
            }
            completion(.success(filmDetailsResponse))
        }.resume()
    }
}
enum DownloadError:Error{
    case wrongUrl
    case dataNotCome
    case dataNotProcessed
}
