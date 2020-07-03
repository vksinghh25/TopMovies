//
//  DetailModel.swift
//  TopMovies
//
//  Created by Vipan Singh on 01/07/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import Foundation

public class MovieDetailModel {
    var title: String?
    var summary: String?
    var copyrights: String?
    var category: String?
    var imageURL: String?
    
    init(movie: NSDictionary) {
        let movieTitle = movie.value(forKeyPath: "im:name.label") as? String ?? "Title Not Found"
        self.title = movieTitle
        
        let category = movie.value(forKeyPath: "category.attributes.label") as? String ?? ""
        self.category = category
        
        let movieSummary = movie.value(forKeyPath: "summary.label") as? String ?? ""
        self.summary = movieSummary
        
        let movieCopyrightsInfo = movie.value(forKeyPath: "rights.label") as? String ?? ""
            self.copyrights = movieCopyrightsInfo
            
        guard let images = movie.value(forKeyPath: "im:image") as? [NSDictionary], let imageURL = images[2].value(forKeyPath: "label") as? String else {
                return
        }
        self.imageURL = imageURL
    }
}

