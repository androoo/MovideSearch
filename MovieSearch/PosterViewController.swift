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
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var posterDetailImageView: UIImageView!
    
    
    //MARK: - View Life
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Helper Methods
    
    func updateViews() {
        guard let movie = movie else { return }
        
        ImageController.getPoster(atURL: movie.poster, completion: { (image) in
            self.posterDetailImageView.image = image
        })
    }
    
    //MARK: - UI Actions
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
    }
    
    
    
    
}
