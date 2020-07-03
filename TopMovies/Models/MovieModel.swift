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
        self.movieTitle = movie.value(forKeyPath: "im:name.label") as? String ?? ""
        
        let purchasePrice = movie.value(forKeyPath: "im:price.label") as? String ?? "Not available for purchase"
        if(purchasePrice.starts(with: "$")) {
            self.purchasePrice = "Purchase for: \(purchasePrice)"
        } else {
            self.purchasePrice = purchasePrice
        }
        
        let rentalPrice = movie.value(forKeyPath: "im:rentalPrice.label") as? String ?? "Not available for rent"
        if(rentalPrice.starts(with: "$")) {
            self.rentalPrice = "Rent for: \(rentalPrice)"
        } else {
            self.rentalPrice = rentalPrice
        }
        
        guard let images = movie.value(forKeyPath: "im:image") as? [NSDictionary], let imageURL = images[2].value(forKeyPath: "label") as? String else {
                return
        }
        self.movieImageURL = imageURL
    }
}
