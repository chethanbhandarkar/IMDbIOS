//
//  MoviesViewModel.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import Foundation


class MoviesViewModel
{

 var moviesDataList: Observable<Movie> = Observable(nil)
    var api = ApiService.shared
    
    //dount  How to deallocate the API Instance
    init() {
      getMoviesDataList()
    }

    func getMoviesDataList(query: String? = nil){
        let moviesFetchedCompletionHandler: ((Movie)->Void) = { MovieData in
            print(MovieData)
            self.moviesDataList.value = MovieData
            print(self.moviesDataList)
        
        }
            if query != nil
            {
                self.api.getMovieAll(
                    query: query,
                    completionHandler: moviesFetchedCompletionHandler)
            }
            else {
                self.api.getMovieAll(
                    query: "india",
                    completionHandler: moviesFetchedCompletionHandler)
            }
            
        }
    }
    

