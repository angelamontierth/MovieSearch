//
//  MovieController.swift
//  MovieSearch
//
//  Created by Angela Montierth on 3/3/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie?")
    
    /*
     
     - Add anything to url needed to make a request
     - Create a request and wait for the response
     - Handle error if there is one
     - Serialize data into json
     - Parse json as needed
     - Turn jsonDictionaries into model objects (Using the failable initializer.)
     - Call completion (with model object/objects)
     
     */

    static func searchMovies(for title: String, completion: @escaping ([Movie]) -> Void) {
        // - Add anything to url needed to make a request
        
        guard let unwrappedURL = baseURL else { return }
        
        var apiKey = "79e77df6ddd71c9cc245f34dfb6220e8"
        
        let parameters = ["api_key": apiKey, "query": title]
        
        // Create a request and wait for the response
        
        NetworkController.performRequest(for: unwrappedURL, httpMethod: .Get, urlParameters: parameters, body: nil) { (data, error) in
            
            //   Handle error if there is one
            
            if let error = error {
                print(error)
                completion([])
                return
            }
            
            guard let data = data,
            let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any]
                else { completion ([]); return }
            
            //  Parse json as needed
            
            guard let movieArray = jsonDictionary["results"] as? [[String:Any]]
                else { completion([]); return }
            
            //  Turn jsonDictionaries into model objects (Using the failable initializer.)
            
            let movies = movieArray.flatMap({ Movie(dictionary: $0)})
            
            completion(movies)
        }
        
        
    }
    
}











