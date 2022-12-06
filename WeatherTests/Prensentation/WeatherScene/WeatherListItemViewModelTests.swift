//
//  WeatherDetailViewModelTests.swift
//  WeatherTests
//
//  Created by An Tran on 04/12/2022.
//

import XCTest

final class WeatherListItemViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitReturnInstanceCorrectly() throws {
        let weather = Weather.stub(temperature: "28°C", weather: "sunny")
        let viewModel = WeatherListItemViewModel(weather: weather)
        XCTAssertEqual("sunny", viewModel.weather)
        XCTAssertEqual("28°C", viewModel.temperature)
        XCTAssertEqual("28°C", viewModel.title)
    }

    func testDetailWeatherShouldFormatTextCorrectly() throws {
        let weather = Weather.stub(temperature: "28°C", weather: "sunny")
        
        let viewModel = WeatherListItemViewModel(weather: weather)
        XCTAssertEqual("sunny | 28°C", viewModel.detailedWeather)
    }


}
