//
//  ViewController.swift
//  TopMovies
//
//  Created by Vipan K Singh on 30/05/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let movieViewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        movieViewModel.fetchMovies(completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
           
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.getNumberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:
            indexPath) as! TableCell
        
        cell.title.text = movieViewModel.getMovieTitleForIndexPath(indexPath: indexPath)
        cell.rentalPrice.text = movieViewModel.getPurchasePriceForMovieAt(indexPath: indexPath)
        cell.setImageUrl(imageURL: movieViewModel.getImageURLForMovieAt(indexPath: indexPath))
        cell.backgroundColor = indexPath.item % 2 == 0 ? .gray : .lightGray
        
        return cell
    }
}

