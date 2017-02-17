//
//  PosterViewController.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import UIKit

class PosterViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: - Properties
    
    var movie: FoundMovie? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var posterDetailImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    
    //MARK: - View Life
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Helper Methods
    
    func updateViews() {
        guard let movie = movie else { return }
        
        ImageController.getPoster(atURL: movie.poster, completion: { (image) in
            self.posterDetailImageView.image = image
        })
    }
    
    func design() {
        favoriteButton.backgroundColor = UIColor.init(red: 235.0/255.0, green: 28.0/255.0, blue: 101.0/255.0, alpha: 1)
    }
    
    //MARK: - UI Actions
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        let name = movie?.title
        let about = movie?.description
        let poster = movie?.poster
        FavoriteMovieController.shared.add(name: name!, poster: poster!, about: about!)
        dismiss(animated: true, completion: nil)
    }  
}























