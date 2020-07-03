//
//  MoviesOverviewViewModel.swift
//  TopMovies
//
//  Created by Vipan K Singh on 01/07/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class MovieListViewModel {
    
    let moviesClient = MoviesClient()
    var movieListModel = [MovieModel]()
    
    let tableView: UITableView?
    var movies: [NSDictionary]?
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    public func fetchData() {
        moviesClient.fetchMovies { (movies) in
            self.movies = movies
            
            movies?.forEach { (movie) in
                let movieModel = MovieModel(movie: movie)
                self.movieListModel.append(movieModel)
            }
            
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    public func configure(_ cellView: TableCell, index: Int) {
        cellView.title.text = movieListModel[index].movieTitle
        cellView.purchasePrice.text = movieListModel[index].purchasePrice
        cellView.rentalPrice.text = movieListModel[index].rentalPrice
        
        guard let imageURL = movieListModel[index].movieImageURL else { return }
        URLSession.shared.dataTask(with: NSURL(string: imageURL)! as URL, completionHandler: {
           (data, response, error) -> Void in
           DispatchQueue.main.async {
              if let data = data {
                cellView.myImage.image = UIImage(data: data)
              }
           }
        }).resume()
    }
}
