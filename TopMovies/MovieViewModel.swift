//
//  MovieViewModel.swift
//  TopMovies
//
//  Created by Vipan K Singh on 30/05/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {
    
    let moviesClient = MoviesClient()
    var movies: [NSDictionary]?
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        guard let movies = movies else {
            return 0
        }
        return movies.count
    }
    
    func getMovieTitleForIndexPath(indexPath: IndexPath) -> String {
        guard let movies = movies, let title = movies[indexPath.item].value(forKeyPath: "title.label") as? String else {
            return ""
        }
        return title
    }
    
    func getPurchasePriceForMovieAt(indexPath: IndexPath) -> String {
        guard let movies = movies, let price = movies[indexPath.item].value(forKeyPath: "im:price.label") as? String else {
            return ""
        }
        return "Purchase for: \(price)"
    }
    
    func getImageURLForMovieAt(indexPath: IndexPath) -> String {
        guard let movies = movies,
            let images = movies[indexPath.item].value(forKeyPath: "im:image") as? [NSDictionary],
            let imageURL = images[1].value(forKeyPath: "label") as? String else {
                return ""
            }
        return imageURL
    }
    
    func fetchMovies(completion: @escaping () -> ()) {
        moviesClient.fetchMovies { (movies) in
            self.movies = movies
            completion()
        }
    }
}
