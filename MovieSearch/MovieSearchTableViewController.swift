//
//  MovieSearchTableViewController.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Properties
    
    var movies: [FoundMovie] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - View Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
    }
    

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.searchResultsMovieDetailCell, for: indexPath) as? MovieSearchResultsDetailTableViewCell else { return MovieSearchResultsDetailTableViewCell()}
        
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    //MARK: - SearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // get movies 
        guard let searchTerm =  searchBar.text else { return }
        movies = []
        searchBar.resignFirstResponder()
        fetch(moviesWithTitle: searchTerm)
    }
    
    //MARK: - API Methods
    
    func fetch(moviesWithTitle title: String) {
        MovieController.fetchMovies(withApiKey: Keys.apiKey, andSearchTerm: title) { (movies) in
            self.movies = movies
        }
    }
    
    //MARK: - Helper Methods
    
    func design() {
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 121.0/255.0, green: 52.0/255.0, blue: 217.0/255.0, alpha: 1)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow, let detailVC = segue.destination as? PosterViewController else { return }
        let movie = movies[indexPath.row]
        detailVC.movie = movie
    }
}
















