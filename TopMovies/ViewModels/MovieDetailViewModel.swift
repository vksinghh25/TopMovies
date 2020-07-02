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
    
    init(model: MovieDetailModel? = nil) {
        if let detailModel = model {
            self.detailModel = detailModel
        }
    }
    
    public func configure(_ detailView: MovieDetailView) {        
        let attributedSummaryText = textUtil.getAttributed(text: detailModel?.summary ?? "", ofSize: 18)
        detailView.summaryLabel.attributedText = attributedSummaryText
        
        let category = detailModel?.category ?? ""
        let attributedCategoryText = textUtil.getAttributed(text: "(\(category))", ofSize: 22, andBold: true)
        detailView.categoryLabel.attributedText = attributedCategoryText
        
        let copyrights = detailModel?.copyrights ?? ""
        let attributedCopyrightsText = textUtil.getAttributed(text: copyrights, ofSize: 22, andBold: true)
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
