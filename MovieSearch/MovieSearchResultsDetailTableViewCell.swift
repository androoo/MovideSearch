//
//  MovieSearchResultsDetailTableViewCell.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import UIKit

class MovieSearchResultsDetailTableViewCell: UITableViewCell {
    
    //MARK: - Properties 
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    
    //MARK: - Updateviews

    func updateViews() {
        // set the labels
        
        guard let movie = movie else { return }
        movieTitleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        descriptionLabel.text = movie.description
        
        DispatchQueue.main.async {
            ImageController.getPoster(atURL: movie.poster, completion: { (image) in
                self.posterImageView.image = image
            })
        }
    }
}
