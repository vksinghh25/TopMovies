//
//  DetailModel.swift
//  TopMovies
//
//  Created by Vipan Singh on 01/07/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import Foundation

public class DetailModel {
    var title: String?
    var summary: String?
    var copyrights: String?
    var category: String?
    var imageURL: String?
    
    var movie: NSDictionary? {
        didSet {
            guard let movieTitle = movie?.value(forKeyPath: "im:name.label") as? String else { return }
            self.title = movieTitle
            
            guard let category = movie?.value(forKeyPath: "category.attributes.label") as? String
                else { return  }
            self.category = category
            
            guard let movieSummary = movie?.value(forKeyPath: "summary.label") as? String else { return }
            self.summary = movieSummary
            
            guard let movieCopyrightsInfo = movie?.value(forKeyPath: "rights.label") as? String else { return }
                self.copyrights = movieCopyrightsInfo
                
            guard let images = movie?.value(forKeyPath: "im:image") as? [NSDictionary], let imageURL = images[2].value(forKeyPath: "label") as? String else {
                    return
            }
            self.imageURL = imageURL
        }
    }
}
