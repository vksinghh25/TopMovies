//
//  DetailController.swift
//  TopMovies
//
//  Created by Vipan K Singh on 13/06/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    let textUtil = TextUtility()
    
    var summary: String? {
        didSet {
            let attributedSummaryText = textUtil.getAttributed(text: summary!, ofSize: 18)
            summaryLabel.attributedText = attributedSummaryText
        }
    }
    
    var category: String? {
        didSet {
            let attributedCategoryText = textUtil.getAttributed(text: "(\(category!))", ofSize: 22, andBold: true)
            categoryLabel.attributedText = attributedCategoryText
        }
    }
    
    var copyrights: String? {
        didSet {
            let attributedSummaryText = textUtil.getAttributed(text: copyrights!, ofSize: 22, andBold: true)
            copyrightsLabel.attributedText = attributedSummaryText
        }
    }
    
    var titleName: String? {
        didSet {
            let title = titleName!
            let font = UIFont.systemFont(ofSize: 35)
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.white
            shadow.shadowBlurRadius = 5
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.black,
                .shadow: shadow
            ]
            
            let attributedTitleName = NSAttributedString(string: title, attributes: attributes)
            
            titleLabel.attributedText = attributedTitleName
        }
    }
    
    var imageURL: String? {
        didSet {
            URLSession.shared.dataTask(with: NSURL(string: imageURL!)! as URL, completionHandler: { (data, response, error) -> Void in
               DispatchQueue.main.async {
                  if let data = data {
                    self.imageView.image = UIImage(data: data)
                  }
               }
            }).resume()
        }
    }
    
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
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    let categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.numberOfLines = 0
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
    
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        
        view.addSubview(verticalScrollView)
        verticalScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        verticalScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        verticalScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        verticalScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        
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
}
