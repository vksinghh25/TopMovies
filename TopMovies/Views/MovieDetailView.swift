//
//  MovieDetailView.swift
//  TopMovies
//
//  Created by Vipan Singh on 19/06/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class MovieDetailView: UIView {
    
    let textUtil = TextUtility()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let verticalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.text = "Howdy"
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    let categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.numberOfLines = 0
        categoryLabel.text = "Random"
        categoryLabel.textAlignment = .center
        return categoryLabel
    }()
    
    let summaryLabel: UILabel = {
        let summaryLabel = UILabel()
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.numberOfLines = 0
        summaryLabel.textAlignment = .left
        return summaryLabel
    }()
    
    let copyrightsLabel: UILabel = {
        let copyrightsLabel = UILabel()
        copyrightsLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightsLabel.numberOfLines = 0
        copyrightsLabel.textAlignment = .left
        return copyrightsLabel
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(verticalScrollView)
        
        verticalScrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        verticalScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        verticalScrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        verticalScrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        
        verticalScrollView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(categoryLabel)
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(summaryLabel)
        verticalStackView.addArrangedSubview(copyrightsLabel)
        
        verticalStackView.topAnchor.constraint(equalTo: verticalScrollView.topAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: verticalScrollView.leadingAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: verticalScrollView.trailingAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: verticalScrollView.bottomAnchor).isActive = true
        verticalStackView.centerXAnchor.constraint(equalTo: verticalScrollView.centerXAnchor).isActive = true
        
        verticalStackView.setCustomSpacing(0.0, after: titleLabel)
        verticalStackView.setCustomSpacing(15.0, after: categoryLabel)
        verticalStackView.setCustomSpacing(10.0, after: imageView)
        verticalStackView.setCustomSpacing(10.0, after: summaryLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
