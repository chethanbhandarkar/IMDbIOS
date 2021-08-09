//
//  MovieCollectionViewCell.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var moviePoster: UIImageView!
    
 
    func setup(movieItem: Movie.MoviesHomeData?){
        movieTitle.text = movieItem?.title
        moviePoster.loadUrlImage(urlstring: (movieItem?.poster!)!)   
    }
    
}
