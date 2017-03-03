//
//  SearchViewController.swift
//  MovieSearch
//
//  Created by Angela Montierth on 3/3/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    //=======================================================
    // MARK: - Outlets
    //=======================================================

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    //=======================================================
    // MARK: - Lifecycle Functions
    //=======================================================
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        
    //=======================================================
    // MARK: - UISearchBarDelegateFunctions
    //=======================================================

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
            searchBar.resignFirstResponder()
            
            guard let text = searchBar.text else { return }
            
            MovieController.searchMovies(for: text) { (returnedMovie) in
                guard let unwrappedMovie = returnedMovie
                else { return }
                
                self.updateViews(movie: unwrappedMovie)
            }
            
        }
        

    }
    
    func updateViews(movies: Movie) {
        
        titleLabel.text = movies.title
        ratingLabel.text = "\(movies.popularity)"
        summaryLabel.text = movies.overview
        
    }

    
}














