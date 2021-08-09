//
//  MovieDetailsViewController.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import Foundation

import UIKit


class MovieDetailsViewController :UIViewController{
    
    @IBOutlet weak var detailsPoster: UIImageView!
    @IBOutlet weak var detailsPlot: UILabel!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var detailsRating: UILabel!
    
    private var movieDetailsViewModel = MoviesDetailsViewModel()
   
    //variable to store data from previous vc
    var movieData: Movie.MoviesHomeData? = nil
   
    override func viewDidLoad() {
    
    //Binding VC to movieDetailsViewModel, what to do after data is changed
    bindViewControllerToObserver()
       
    //call api here to new
    movieDetailsViewModel.getMoviesDetails(
        id: self.movieData?.imdbID)
    }
    
    
    private func bindViewControllerToObserver()
    {
        movieDetailsViewModel.movieDetailsData.bindVC { [weak self] selectedMovieDetails in
            DispatchQueue.main.async {
                [weak self] in
                self?.detailsRating.text = selectedMovieDetails.imdbrating
                self?.detailsTitle.text = selectedMovieDetails.title
                self?.detailsPoster.loadUrlImage(urlstring: selectedMovieDetails.poster)
                self?.detailsPlot.text = selectedMovieDetails.plot
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       // navigationController?.popViewController(animated: true)
       // dismiss(animated: true, completion:nil)
        print("view will disapear")
    }
    
    deinit{
        print("deinit details vC")
    }
   
    
    
 
}



