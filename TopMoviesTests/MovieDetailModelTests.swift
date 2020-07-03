//
//  MovieDetailModelTests.swift
//  TopMoviesTests
//
//  Created by Vipan Singh on 03/07/20.
//  Copyright © 2020 Vipan K Singh. All rights reserved.
//

import XCTest
@testable import TopMovies

class MovieDetailModelTests: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testWithValues() throws {
        
        let dictionary: NSDictionary = [
            "im:name.label"             : "The Terminator",
            "summary.label"             : "The Terminator Summary",
            "rights.label"              : "Pixar",
            "category.attributes.label" : "Drama"
        ]
        
        let sut = MovieDetailModel(movie: dictionary)
        
        XCTAssert(sut.title == "The Terminator", "Title didn't match")
        XCTAssert(sut.summary == "The Terminator Summary", "Summary didn't match")
        XCTAssert(sut.category == "Drama", "Category didn't match")
        XCTAssert(sut.copyrights == "Pixar", "Copyrights Info didn't match")
        XCTAssert(sut.imageURL == nil, "ImageURL should have been nil ")
    }
    
    func testNoValuesPresentInMovie() throws {
        
        let movie: NSDictionary = [:]
        let sut = MovieDetailModel(movie: movie)
        
        XCTAssert(sut.title == "Title Not Found", "Title shouldn't have been present")
        XCTAssert(sut.category == "", "Category should have been empty")
        XCTAssert(sut.copyrights == "", "Copyrights Info should have been empty")
    }
}
