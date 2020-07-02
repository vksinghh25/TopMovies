//
//  ViewController.swift
//  TopMovies
//
//  Created by Vipan K Singh on 30/05/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var movieListViewModel: MovieListViewModel?
    
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
        
        movieListViewModel = MovieListViewModel(tableView: tableView)
        movieListViewModel?.fetchMovies()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel?.movieListModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = DetailController()
        detailController.movie = movieListViewModel?.movies?[indexPath.item]
        
        navigationController?.navigationBar.topItem?.title = "All Movies"
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:
            indexPath) as! TableCell
        
        movieListViewModel?.configure(cell, index: indexPath.item)
        cell.backgroundColor = indexPath.item % 2 == 0 ? .gray : .lightGray
        return cell
    }
}
