//
//  MovieController.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation

class MovieController {
    
    static func fetchMovies(withApiKey apiKey: String, andSearchTerm title: String, completion: @escaping (_ movis: [Movie]) -> Void) {
        
        guard let url = Keys.baseURL else { return }
        let urlParameters = ["api_key": "\(Keys.apiKey)", "query": "\(title)"]
        
        defer { completion([]) }
        
        NetworkController.performRequest(forURL: url, withMethod: .get, urlParameters: urlParameters) { (data, error) in
            
            if let error = error {
                NSLog(error.localizedDescription)
            }
            
            guard let data = data, let stringFromData = String(data: data, encoding: .utf8) else {
                NSLog("Could not get any data")
                return
            }
            
            guard let dictionaryFromString = ( try? JSONSerialization.jsonObject(with: data)) as? JSONDictionary, let moviesDictionary = dictionaryFromString["results"] as? [JSONDictionary] else {
                NSLog("Could not serialize \(stringFromData)")
                return
            }
            
            let movies = moviesDictionary.flatMap { Movie(dictionary: $0) }
            
            DispatchQueue.main.async {
                completion(movies)
            }
        }
    }
}
