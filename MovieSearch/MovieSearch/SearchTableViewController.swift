//
//  SearchTableViewController.swift
//  MovieSearch
//
//  Created by Angela Montierth on 3/3/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        MovieController.searchMovies(for: searchBar.text) { (movies)
        }
       
    }

   
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MovieController.movies
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        return cell
    }

    }
