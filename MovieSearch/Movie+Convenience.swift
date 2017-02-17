//
//  Movie+Convenience.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation
import CoreData

extension Movie {
    
    @discardableResult convenience init(name: String, favorite: Bool = false, about: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.name = name
        self.favorite = favorite
        self.about = about
    }
}
