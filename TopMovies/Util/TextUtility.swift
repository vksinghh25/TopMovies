//
//  TextUtility.swift
//  TopMovies
//
//  Created by Vipan K Singh on 14/06/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import UIKit

class TextUtility {
    
    func getAttributed(text: String, ofSize: CGFloat, andBold: Bool = false, withShadow: Bool = false, withSize: CGFloat = 5.0) -> NSAttributedString {
        
        let font = andBold ? UIFont.boldSystemFont(ofSize: ofSize) : UIFont.systemFont(ofSize: ofSize)
        
        let shadow = NSShadow()
        if(withShadow) {
            shadow.shadowColor = UIColor.white
            shadow.shadowBlurRadius = withSize
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.black,
            .shadow: shadow
        ]
        
        let attributedAppTitleText = NSAttributedString(string: text, attributes: attributes)
        return attributedAppTitleText
    }
}
