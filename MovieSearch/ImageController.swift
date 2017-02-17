//
//  ImageController.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation

import UIKit

class ImageController {
    
    static func getPoster(atURL urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let imageUrl = Keys.imageURL?.appendingPathComponent(urlString) else { return }
        
        NetworkController.performRequest(forURL: imageUrl, withMethod: .get) { (data, error) in
            
            if let error = error {
                NSLog(error.localizedDescription)
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
