//
//  CharacterModelTests.swift
//  CharacterModelTests
//
//  Created by Alisher Abdukarimov on 4/26/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import XCTest
@testable import CharacterModel

class CharacterModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testJsonObject() {
      let ali = Character(name: "Ali", life: 100, magic: 0, experience: 0.0, weapon: Pistol(), image: UIImage(named: "pizza")!)
      let result = ali.jsonObject
        
        if let resultName = result["name"] as? String,
           let resultLife = result["life"] as? Int,
           let resultMagic = result["magic"] as? Int,
           let resultExperience = result["experience"] as? Double,
           let resultImage = result["image"] as? UIImage {
            
            
            XCTAssertEqual(resultName, "Ali")
            XCTAssertEqual(resultLife, 100)
            XCTAssertEqual(resultMagic, 0)
            XCTAssertEqual(resultExperience, 0.0)
            XCTAssertEqual(resultImage, UIImage(named: "pizza")!)
            
        }
        
    }
    
    func testJsonObject2() {
        let bob = Character(name: "BoB", life: 200, magic: 0, experience: 0.0, weapon: Pistol(), image: UIImage(named: "joker")!)
        let result = bob.jsonObject
        
        if let resultName = result["name"] as? String,
            let resultLife = result["life"] as? Int,
            let resultMagic = result["magic"] as? Int,
            let resultExperience = result["experience"] as? Double,
            let resultImage = result["image"] as? UIImage {
            
            
            XCTAssertEqual(resultName, "BoB")
            XCTAssertEqual(resultLife, 200)
            XCTAssertEqual(resultMagic, 0)
            XCTAssertEqual(resultExperience, 0.0)
            XCTAssertEqual(resultImage, UIImage(named: "joker")!)
            
        }
    }
    
    
    
}
