//
//  TableCell.swift
//  TopMovies
//
//  Created by Vipan K Singh on 30/05/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    let myImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image 
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 28)
        return title
    }()
    
    let purchasePrice: UILabel = {
        let purchase = UILabel()
        purchase.translatesAutoresizingMaskIntoConstraints = false
        purchase.font = UIFont.systemFont(ofSize: 12)
        purchase.textColor = UIColor.blue
        return purchase
    }()
    
    let rentalPrice: UILabel = {
        let rental = UILabel()
        rental.translatesAutoresizingMaskIntoConstraints = false
        rental.font = UIFont.systemFont(ofSize: 12)
        rental.textColor = UIColor.blue
        return rental
    }()
    
    func setImageUrl(imageURL: String) {
        URLSession.shared.dataTask(with: NSURL(string: imageURL)! as URL, completionHandler: {
           (data, response, error) -> Void in
           DispatchQueue.main.async {
              if let data = data {
                self.myImage.image = UIImage(data: data)
              }
           }
        }).resume()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(horizontalStackView)
        
        contentView.layer.borderWidth = 0.2
        contentView.layer.borderColor = UIColor.black.cgColor
        
        horizontalStackView.addArrangedSubview(myImage)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(title)
        verticalStackView.addArrangedSubview(rentalPrice)
        verticalStackView.addArrangedSubview(purchasePrice)
        
        horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        myImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        myImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
