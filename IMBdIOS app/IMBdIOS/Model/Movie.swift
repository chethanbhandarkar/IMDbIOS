//
//  Movie.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import Foundation


struct Movie : Codable{
    
    var response: String?
    
    var search: [MoviesHomeData]?
    
    enum CodingKeys :String, CodingKey
    {
        case response = "Response"
        case search = "Search"
    }
    
    
    struct MoviesHomeData : Codable {
        
        var title: String? = nil
        
        var year: String? = nil
        
        var imdbID: String? = nil
        
        var type: String? = nil
        
        var poster: String? = nil
        
        enum CodingKeys: String, CodingKey {
            
            case title = "Title"
            case year = "Year"
            case imdbID = "imdbID"
            case type = "Type"
            case poster = "Poster"
            
            
            
        }
        
    }
    
    
}

