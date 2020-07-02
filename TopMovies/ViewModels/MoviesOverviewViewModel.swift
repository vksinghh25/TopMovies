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
    var movies: [NSDictionary]?
    var moviesOverviewModel = [MovieOverviewModel]()
    let tableView: UITableView?
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    public func fetchData() {
        moviesClient.fetchMovies { (movies) in
            self.movies = movies
            movies?.forEach { (movie) in
                let movieOverviewModel = MovieOverviewModel()
                movieOverviewModel.movie = movie
                self.moviesOverviewModel.append(movieOverviewModel)
            }
            
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    public func configure(_ cellView: TableCell, index: Int) {
        cellView.title.text = moviesOverviewModel[index].title
        cellView.purchasePrice.text = moviesOverviewModel[index].purchasePrice
        cellView.rentalPrice.text = moviesOverviewModel[index].rentalPrice
        
        guard let imageURL = moviesOverviewModel[index].imageURL else { return }
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
