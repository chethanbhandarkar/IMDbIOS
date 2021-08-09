//
//  MovieDetails.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import Foundation


struct MovieDetails : Codable {
    var response: String
    var website: String
    var production: String
    var boxoffice: String
    var dvd: String
    var type: String
    var imdbid: String
    var imdbvotes: String
    var imdbrating: String
    var metascore: String
    var ratings: [Ratings]
    var poster: String
    var awards: String
    var country: String
    var language: String
    var plot: String
    var actors: String
    var writer: String
    var director: String
    var genre: String
    var runtime: String
    var released: String
    var rated: String
    var year: String
    var title: String
    
    enum CodingKeys : String, CodingKey
    {
        case response = "Response"
        case website = "Website"
        case production = "Production"
        case boxoffice = "BoxOffice"
        case dvd = "DVD"
        case type = "Type"
        case imdbid = "imdbID"
        case imdbvotes = "imdbVotes"
        case imdbrating = "imdbRating"
        case metascore = "Metascore"
        case ratings = "Ratings"
        case poster = "Poster"
        case awards = "Awards"
        case country = "Country"
        case language = "Language"
        case plot = "Plot"
        case actors = "Actors"
        case writer = "Writer"
        case director = "Director"
        case genre = "Genre"
        case runtime = "Runtime"
        case released = "Released"
        case rated = "Rated"
        case year = "Year"
        case title = "Title"
        
    }
    
    struct Ratings : Codable {
        var value: String
        var source: String
        
        enum CodingKeys : String , CodingKey{
            case value = "Value"
            case source = "Source"
        }
    }
}
