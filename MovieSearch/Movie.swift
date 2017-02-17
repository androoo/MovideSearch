//
//  Movie.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation

struct FoundMovie {
    
    let title: String
    let rating: Float
    let description: String
    let poster: String
    
}

extension FoundMovie {
    
    init?(dictionary: JSONDictionary) {
        guard let title = dictionary[Keys.titleKey] as? String,
            let rating = dictionary[Keys.ratingKey] as? Float,
            let description = dictionary[Keys.descriptionKey] as? String,
            let poster = dictionary[Keys.posterKey] as? String else { return nil }
        self.init(title: title, rating: rating, description: description, poster: poster)
    }
    
}
