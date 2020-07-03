//
//  DetailViewModel.swift
//  TopMovies
//
//  Created by Vipan Singh on 01/07/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class MovieDetailViewModel {
    
    var detailModel: MovieDetailModel?
    let textUtil = TextUtility()
    
    var movie: NSDictionary?
    
    init(movie: NSDictionary) {
        self.detailModel = MovieDetailModel(movie: movie)
    }
    
    public func configure(_ detailView: MovieDetailView) {
        let summary = detailModel?.summary ?? ""
        let attributedSummaryText = textUtil.getAttributed(text: summary, ofSize: 18)
        detailView.summaryLabel.attributedText = attributedSummaryText
        
        let category = detailModel?.category ?? ""
        let text = category == "" ? "" : "(\(category))"
        
        let attributedCategoryText = textUtil.getAttributed(text: text, ofSize: 20, andBold: true)
        detailView.categoryLabel.attributedText = attributedCategoryText
        
        let copyrights = detailModel?.copyrights ?? ""
        let attributedCopyrightsText = textUtil.getAttributed(text: copyrights, ofSize: 12, andBold: true)
        detailView.copyrightsLabel.attributedText = attributedCopyrightsText
        
        let title = detailModel?.title ?? ""
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
        
        detailView.titleLabel.attributedText = attributedTitleName
        
        guard let imageURL = detailModel?.imageURL else { return }
        URLSession.shared.dataTask(with: NSURL(string: imageURL)! as URL, completionHandler: { (data, response, error) -> Void in
           DispatchQueue.main.async {
              if let data = data {
                detailView.imageView.image = UIImage(data: data)
              }
           }
        }).resume()
    }
}
