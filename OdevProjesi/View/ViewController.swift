//
//  ViewController.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 6.08.2021.
//

import UIKit
import Network
import SDWebImage
import FirebaseAnalytics
import ANLoader

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var filmTableViewModel:FilmTableViewModel!
    private var filmDetailsViewModel:FilmDetailViewModel!
    var imdbArray=[String]()
    var searchFilm = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        searchBar.delegate=self
        
        CheckInternetConnection().monitorNetwork(viewController: self)
    }
    func showFilmData(searchFilm:String){
        
        let dowmloadFilmsData = DownloadFilmsData()
        
            dowmloadFilmsData.downloadFilms(search: searchFilm) { (result) in
                switch result{
                case.failure(let hata):
                    DispatchQueue.main.async {
                        if hata==DownloadError.dataNotCome{
                            CheckInternetConnection().Alert(title: "Warning", message: "Could not retrieve data from internet.Please check your internet connection", viewController: self)
                        }
                        
                    }
                case.success(let filmArray):
                if let filmArray = filmArray{
                    self.filmTableViewModel=FilmTableViewModel(filmsArray: filmArray)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        }
                    
                    }
                }
            }
    }
    func showFilmDetail(imdbId:String){
        let dowmloadFilmDetail = DownloadFilmsData()
            
            dowmloadFilmDetail.downloadFilmDetails(imdbId: imdbId) { (result) in
                switch result{
                case.failure(let hata):
                    DispatchQueue.main.async {
                        if hata==DownloadError.dataNotCome{
                            CheckInternetConnection().Alert(title: "Warning", message: "Could not retrieve data from internet.Please check your internet connection", viewController: self)
                        }
                        
                    }
                case.success(let filmDetails):
                        self.filmDetailsViewModel=FilmDetailViewModel(filmDetails: filmDetails)
                }
            }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmTableViewModel == nil ? 0 : filmTableViewModel.numberOfRowSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FilmsTableViewCell
        let filmsViewModel = filmTableViewModel.filmAtIndexPath(indexPath.row)
        cell.filmNameLabel.text = filmsViewModel.title
        cell.filmYearLabel.text = filmsViewModel.year
        imdbArray.append(filmsViewModel.imdbID)
        cell.filmImage.sd_setImage(with: URL(string:filmsViewModel.poster), placeholderImage:UIImage(named: "loading.png"))
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        showFilmDetail(imdbId: imdbArray[indexPath.row])
        performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsVc" {
            let destinationVC = segue.destination as! DetailsViewController
                DispatchQueue.main.async {
                    destinationVC.filmTitleLabel.text = self.filmDetailsViewModel.filmDetails.title
                    destinationVC.filmImage.sd_setImage(with: URL(string:self.filmDetailsViewModel.filmDetails.poster), placeholderImage:UIImage(named: "loading.png"))
                    destinationVC.filmPlot.text = "Plot:\(self.filmDetailsViewModel.filmDetails.plot)"
                    destinationVC.filmDirectorLabel.text = "Director: \(self.filmDetailsViewModel.filmDetails.director)"
                    destinationVC.filmImdbRatingLabel.text = "Imdb Rating:\(self.filmDetailsViewModel.filmDetails.imdbRating)"
                    ClientAnalytics().MovieDetailViewedEvent(filmTitleViewed: self.filmDetailsViewModel.filmDetails.title, filmDirectorViewed: self.filmDetailsViewModel.filmDetails.director,filmPlotViewed: self.filmDetailsViewModel.filmDetails.plot, filmImdbRating: self.filmDetailsViewModel.filmDetails.imdbRating)
                }
            
            
        }
                  
               
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        imdbArray.removeAll()
        if !searchBar.text!.isEmpty {
            searchFilm = searchBar.text!
            showFilmData(searchFilm: searchFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchFilm)
          
        }
       
    }
    
}
