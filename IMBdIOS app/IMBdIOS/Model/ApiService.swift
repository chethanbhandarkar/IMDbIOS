//
//  ApiService.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import Foundation


class ApiService{
    
    
    static let shared = ApiService()
    private init() {}
    private let BASE_URL = "https://www.omdbapi.com/?apikey=e8064aa3"
    func getMovieAll(query: String? = nil,completionHandler: @escaping (Movie)->()) {
        let tempString = "\(query!)"
        let urlString = query == nil ? BASE_URL + "&s=America" : BASE_URL + "&s=\(tempString)"
        
        print(urlString)
        
        let url = URL(string: urlString)
        guard url != nil else{
            print("Invalid URL")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!){
            (data, response, error) in
            
            if(error == nil && data != nil)
            {
                let decoder = JSONDecoder()
                
                do{
                    let MoviesData =  try decoder.decode(Movie.self, from: data!)
                    
                    completionHandler(MoviesData)
                }
                catch{
                    print("error")
                    
                }
            }
            else{
                print("error")
                
            }
        }
        dataTask.resume()
        
    }
    
    
    
    //MOVIE DETAILS CALL
    
    func getMovieDetail(id : String, completionhandler : @escaping (MovieDetails)-> Void ){
        
        
        let urlString = BASE_URL + "&i=\(id)"
        print(urlString)
        
        let url = URL(string: urlString)
        
        guard url != nil else{
            print("Invalid URL")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!){
            (data, response, error) in
            
            if(error == nil && data != nil)
            {
                let decoder=JSONDecoder()
                
                do{
                    
                    let MoviesDetailsData =  try decoder.decode(MovieDetails.self, from: data!)
                    
                    completionhandler(MoviesDetailsData)
                }
                catch{
                    print("error 1")
                    
                }     
            }
            else{
                
                print("error 2")
                
            }
            
        }
        
        dataTask.resume()
        
    }
    
}
