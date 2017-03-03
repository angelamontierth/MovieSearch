//
//  Movie.swift
//  MovieSearch
//
//  Created by Angela Montierth on 3/3/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation

class Movie {
    
    private let titleKey = "title"
    private let overviewKey = "overview"
    private let popularityKey = "popularity"

    let title: String
    let overview: String
    let popularity: Int
    
    init?(dictionary: [String:Any]) {
        
        guard let title = dictionary[titleKey] as? String,
        let overview = dictionary[overviewKey] as? String,
        let popularity = dictionary[popularityKey] as? Int
        
            else { return nil }
        
        self.title = title
        self.overview = overview
        self.popularity = popularity
        
    }
    

}
