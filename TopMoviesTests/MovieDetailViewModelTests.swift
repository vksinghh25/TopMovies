//
//  MovieDetailViewModelTests.swift
//  TopMoviesTests
//
//  Created by Vipan Singh on 03/07/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import XCTest
@testable import TopMovies

class MovieDetailViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testEmpty() throws {
        
        let movie: NSDictionary = [:]
        let mockDetailView = MovieDetailView()
        
        let sut = MovieDetailViewModel(movie: movie)
        sut.configure(mockDetailView)
        
        XCTAssert(mockDetailView.titleLabel.text == "Title Not Found")
        XCTAssert(mockDetailView.categoryLabel.text == "")
        XCTAssert(mockDetailView.summaryLabel.text == "")
        XCTAssert(mockDetailView.copyrightsLabel.text == "")
    }
    
    func testAll() throws {
        
        let movie: NSDictionary = [
            "im:name.label"             : "The Terminator",
            "summary.label"             : "Summary Text",
            "rights.label"              : "Pixar",
            "category.attributes.label" : "Drama"
        ]
        let mockDetailView = MovieDetailView()
        
        let sut = MovieDetailViewModel(movie: movie)
        sut.configure(mockDetailView)
        
        XCTAssert(mockDetailView.titleLabel.text == "The Terminator")
        XCTAssert(mockDetailView.categoryLabel.text == "(Drama)")
        XCTAssert(mockDetailView.summaryLabel.text == "Summary Text")
        XCTAssert(mockDetailView.copyrightsLabel.text == "Pixar")
    }
}
