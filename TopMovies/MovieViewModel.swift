//
//  SingleMovieViewModel.swift
//  TopMovies
//
//  Created by Vipan Singh on 19/06/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    var movieTitle: String?
    var movieSummary: String?
    var movieCopyrightsInfo: String?
    var movieCategory: String?
    var purchasePrice: String?
    var rentalPrice: String?
    var imageURL: String? 
    
    var movie: NSDictionary? {
        didSet {
            guard let movieTitle = movie?.value(forKeyPath: "im:name.label") as? String else { return }
            self.movieTitle = movieTitle
        
            guard let movieSummary = movie?.value(forKeyPath: "summary.label") as? String else { return }
            self.movieSummary = movieSummary
        
            guard let movieCopyrightsInfo = movie?.value(forKeyPath: "rights.label") as? String else { return }
            self.movieCopyrightsInfo = movieCopyrightsInfo
        
            guard let movieCategory = movie?.value(forKeyPath: "category.attributes.label") as? String else { return }
            self.movieCategory = movieCategory
        
            guard let purchasePrice = movie?.value(forKeyPath: "im:price.label") as? String else { return }
            if(purchasePrice.starts(with: "$")) {
                self.purchasePrice = "Purchase for: \(purchasePrice)"
            }
        
            guard let rentalPrice = movie?.value(forKeyPath: "im:rentalPrice.label") as? String else { return }
            if(rentalPrice.starts(with: "$")) {
                self.rentalPrice = "Rent for: \(rentalPrice)"
            }
            
            guard let images = movie?.value(forKeyPath: "im:image") as? [NSDictionary], let imageURL = images[1].value(forKeyPath: "label") as? String else {
                return
            }
            self.imageURL = imageURL
        }
    }
}
