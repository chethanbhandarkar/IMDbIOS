//
//  MoviesDetailsViewModel.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import Foundation


class MoviesDetailsViewModel{
   
       var movieDetailsData : Observable<MovieDetails> = Observable(nil)
       var api = ApiService.shared
     
       func getMoviesDetails(id: String? = nil){
        
        //1
        guard id != nil else {
            print("id is nil")
            return
        }
        //2 Completion handler to know  data is fetched  , here we assign fetched data to observable
        
        let movieDetailsFetchedCompletionHandler:((MovieDetails)->Void) = { [weak self] MovieDetailsData in
            
        self?.movieDetailsData.value = MovieDetailsData

        }
        
        //3 
      
        api.getMovieDetail(id: id!, completionhandler: movieDetailsFetchedCompletionHandler)
      
        
       
        
       }
      
}

