//
//  WeatherFlowCoordinatorTests.swift
//  WeatherTests
//
//  Created by An Tran on 06/12/2022.
//

import XCTest

final class WeatherFlowCoordinatorTests: XCTestCase {
    
    let navigationController = UINavigationController()
    
    let dependencies = FlowDependenciesStub()

    lazy var sut = {
        WeatherFlowCoordinatorStub(navigationController: self.navigationController, dependencies: self.dependencies)
    }
    
    func testFlowStartCorrectly() throws {
        let weatherFlowSut = sut()
        
        XCTAssertEqual(false, weatherFlowSut.started)
        weatherFlowSut.start()
        XCTAssertEqual(true, weatherFlowSut.started)
    }
    
}
