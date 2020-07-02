//
//  MoviesClient.swift
//  TopMovies
//
//  Created by Vipan K Singh on 30/05/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {

    func fetchMovies(completion: @escaping ([NSDictionary]?) -> ()) {
        
        let session = URLSession.shared
        
        guard let url = URL(string: "https://itunes.apple.com/us/rss/topmovies/limit=100/json") else {
            return
        }
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if(error != nil) {
                completion(nil)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                if let movies = json?.value(forKeyPath: "feed.entry") as? [NSDictionary] {
                    completion(movies)
                    return
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}
