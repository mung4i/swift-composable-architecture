//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Martin Mungai on 30/06/2022.
//  Copyright © 2022 Point-Free. All rights reserved.
//

import Identifiers
import XCTest

protocol BaseXCTestCase: AnyObject  {
    func validateView()
}

class TicTacToeUITests: XCTestCase {
    var app: XCUIApplication {
        .init()
    }
    
    func validateView() {
        XCTAssert(app.buttons[RootIdentifiers.btnSwiftUIVersion.rawValue].exists)
        XCTAssert(app.buttons[RootIdentifiers.btnUIKitVersion.rawValue].exists)
        XCTAssert(app.navigationBars[RootIdentifiers.title.rawValue].exists)
    }
    
    func testValidateRootView() {
        app.launch()
        
        validateView()
    }
    
    func testNavigateToSwiftUIVersion() {
        app.launch()
        
        validateView()
        
        app.buttons[RootIdentifiers.btnSwiftUIVersion.rawValue].tap()
        XCTAssert(app.navigationBars[LoginIdentifiers.title.rawValue].exists)
        
    }
}
