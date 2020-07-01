//
//  TopMoviesTests.swift
//  TopMoviesTests
//
//  Created by Vipan K Singh on 01/07/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import XCTest
@testable import TopMovies

class TopMoviesTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testAllFieldsBeingPresentExceptImageURL() throws {
        let dictionary: NSDictionary = [
            "im:name.label"             : "The Terminator",
            "summary.label"             : "Summary Text",
            "rights.label"              : "Pixar",
            "category.attributes.label" : "Drama",
            "im:price.label"            : "$10.99",
            "im:rentalPrice.label"      : "$4.99"
        ]
        
        let movieViewModel = MovieViewModel()
        movieViewModel.movie = dictionary
        
        XCTAssert(movieViewModel.movieTitle == "The Terminator", "Title Not Matching")
        XCTAssert(movieViewModel.movieSummary == "Summary Text", "Summary Not Matching")
        XCTAssert(movieViewModel.movieCopyrightsInfo == "Pixar", "Summary Not Matching")
        XCTAssert(movieViewModel.movieCategory == "Drama", "Category Not Matching")
        XCTAssert(movieViewModel.purchasePrice == "Purchase for: $10.99", "Purchase Price Not as expected")
        XCTAssert(movieViewModel.rentalPrice == "Rent for: $4.99", "Rental Price Not as expected")
        XCTAssert(movieViewModel.imageURL == nil, "ImageURL Not Nil as expected")
    }

    func testNilFieldsAfterCategory() throws {
        let dictionary: NSDictionary = [
            "im:name.label"             : "The Terminator",
            "summary.label"             : "Summary Text",
            "rights.label"              : "Pixar",
            "category.attributes.label" : "Drama"
        ]
        
        let movieViewModel = MovieViewModel()
        movieViewModel.movie = dictionary
        
        XCTAssert(movieViewModel.movieTitle == "The Terminator", "Title Not Matching")
        XCTAssert(movieViewModel.movieSummary == "Summary Text", "Summary Not Matching")
        XCTAssert(movieViewModel.movieCopyrightsInfo == "Pixar", "Summary Not Matching")
        XCTAssert(movieViewModel.movieCategory == "Drama", "Category Not Matching")
        XCTAssert(movieViewModel.purchasePrice == nil, "Purchase Price Not Nil as expected")
        XCTAssert(movieViewModel.rentalPrice == nil, "Rental Price Not Nil as expected")
        XCTAssert(movieViewModel.imageURL == nil, "ImageURL Not Nil as expected")
    }
}
