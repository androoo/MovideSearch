//
//  favoriteMovieListTableViewCell.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import UIKit

protocol FavoriteMovieButtonDelgate: class {
    func favoriteMovieButtonTapped(_ sender: FavoriteMovieListTableViewCell)
}

class FavoriteMovieListTableViewCell: UITableViewCell {
    
    //MARK: - properties
    
    var movie: Movie? {
        didSet {
            updateView()
        }
    }
    
    weak var delegate: FavoriteMovieButtonDelgate?
    
    //MARK: - Outlets 
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    //MARK: - UI Actions
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        delegate?.favoriteMovieButtonTapped(self)
    }
    
    
    //MARK: - Helpers
    
    func updateView() {
        guard let movie = movie else { return }
        movieTitleLabel.text = movie.name
        descriptionLabel.text = movie.about
    
        DispatchQueue.main.async {
            ImageController.getPoster(atURL: movie.poster!, completion: { (image) in
                self.posterImageView.image = image
            })
        }
    }
}



























