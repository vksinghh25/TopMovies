//
//  DetailController.swift
//  TopMovies
//
//  Created by Vipan K Singh on 13/06/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    let movieDetailView = MovieDetailView()
    
    var movieViewModel: MovieViewModel? {
        didSet {
            movieDetailView.movieViewModel = movieViewModel
        }
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        
        movieDetailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieDetailView)
        
        movieDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        movieDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
