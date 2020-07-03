//
//  MovieOverviewModel.swift
//  TopMovies
//
//  Created by Vipan K Singh on 01/07/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import Foundation

public class MovieModel {
    var movieTitle: String?
    var purchasePrice: String?
    var rentalPrice: String?
    var movieImageURL: String?
    
    init(movie: NSDictionary) {
        guard let movieTitle = movie.value(forKeyPath: "im:name.label") as? String else { return }
        self.movieTitle = movieTitle
        
        guard let purchasePrice = movie.value(forKeyPath: "im:price.label") as? String else {
            self.purchasePrice = "Not available for Purchase"
            return
        }
        if(purchasePrice.starts(with: "$")) {
            self.purchasePrice = "Purchase for: \(purchasePrice)"
        }
        
        guard let rentalPrice = movie.value(forKeyPath: "im:rentalPrice.label") as? String else {
            self.rentalPrice = "Not available for Rent"
            return
        }
        if(rentalPrice.starts(with: "$")) {
            self.rentalPrice = "Rent for: \(rentalPrice)"
        }
        
        guard let images = movie.value(forKeyPath: "im:image") as? [NSDictionary], let imageURL = images[2].value(forKeyPath: "label") as? String else {
                return
        }
        self.movieImageURL = imageURL
    }
}
