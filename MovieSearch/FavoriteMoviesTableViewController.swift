//
//  FavoriteMoviesTableViewController.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import UIKit

class FavoriteMoviesTableViewController: UITableViewController, FavoriteMovieButtonDelgate {
    
    //MARK: - View Life
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteMovieController.shared.favoriteMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as? FavoriteMovieListTableViewCell else { return FavoriteMovieListTableViewCell()}
        
        let movie = FavoriteMovieController.shared.favoriteMovies[indexPath.row]
        cell.delegate = self
        cell.movie = movie
        
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    //MARK: - Favorite Button Delegate
    
    func favoriteMovieButtonTapped(_ sender: FavoriteMovieListTableViewCell) {
        guard let movie = sender.movie,
            let indexPath = tableView.indexPath(for: sender) else { return }
        FavoriteMovieController.shared.toggleFavorite(movie: movie)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
    }
}
