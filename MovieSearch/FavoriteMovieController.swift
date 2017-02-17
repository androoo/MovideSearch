//
//  FavoriteMovieController.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation
import CoreData

class FavoriteMovieController {
    
    static let shared = FavoriteMovieController()
    
    //MARK: - Properties 
    
    var favoriteMovies: [Movie] {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        return( try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    
    // CRUD
    
    func add(name: String, poster: String, about: String) {
        let _ = Movie(name: name, poster: poster, about: about)
        saveToPersistentStorage()
    }
    
    func remove(movie: Movie) {
        CoreDataStack.context.delete(movie)
        saveToPersistentStorage()
    }
    
    func toggleFavorite(movie: Movie) {
        movie.favorite = !movie.favorite
        saveToPersistentStorage()
    }
    
    // Save to persistent store 
    
    func saveToPersistentStorage() {
        do {
            try CoreDataStack.context.save()
        } catch let error {
            print("could not save movie \(error)")
        }
    }
}
