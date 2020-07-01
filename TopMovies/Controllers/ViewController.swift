//
//  ViewController.swift
//  TopMovies
//
//  Created by Vipan K Singh on 30/05/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var movies: [NSDictionary]?
    let moviesClient = MoviesClient()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        let textUtil = TextUtility()
        let attributedAppTitleText = textUtil.getAttributed(text: "Top iTunes Movies", ofSize: 40, andBold: true, withShadow: true, withSize: 5)
        
        titleLabel.attributedText = attributedAppTitleText
        titleLabel.backgroundColor = .lightGray
        titleLabel.textAlignment = .center
        titleLabel.layer.borderWidth = 0.5
        titleLabel.layer.borderColor = UIColor.black.cgColor
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchMovies()
    }
    
    private func fetchMovies() {
        moviesClient.fetchMovies { (movies) in
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = DetailController()
        
        let movieViewModel = MovieViewModel()
        guard let movies = self.movies else {
            return
        }
        
        movieViewModel.movie = movies[indexPath.item]
        detailController.movieViewModel = movieViewModel
        
        navigationController?.navigationBar.topItem?.title = "All Movies"
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:
            indexPath) as! TableCell
        
        let movieViewModel = MovieViewModel()
        guard let movies = self.movies else {
            return cell 
        }
        movieViewModel.movie = movies[indexPath.item]
        
        cell.movieViewModel = movieViewModel
        cell.backgroundColor = indexPath.item % 2 == 0 ? .gray : .lightGray
        return cell
    }
}