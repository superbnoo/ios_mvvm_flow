//
//  WeatherListViewModelTests.swift
//  WeatherTests
//
//  Created by An Tran on 04/12/2022.
//

import XCTest

final class WeatherListViewModelTests: XCTestCase {

    let navigationController = UINavigationController()
    
    let dependencies = FlowDependenciesStub()

    lazy var sut = {
        WeatherFlowCoordinatorStub(navigationController: self.navigationController, dependencies: self.dependencies)
    }
    
    func testDidSelectItemShouldShowTheCorrectItem() throws {
        let weatherFlowSut = sut()
        let showDetail = weatherFlowSut.showWeatherDetails
        let viewModel = DefaultWeatherListViewModel(
            actions: WeatherListViewModelActions(
                showWeatherDetails: showDetail
            )
        )
        let weathers = [Weather.stub(city: "New York"), Weather.stub(city: "Singapore")]
        viewModel.items.value = weathers.map(WeatherListItemViewModel.init)
        
        XCTAssertEqual("", weatherFlowSut.showDetailTitle)
        viewModel.didSelectItem(at: 0)
        XCTAssertEqual("New York", weatherFlowSut.showDetailTitle)
        viewModel.didSelectItem(at: 1)
        XCTAssertEqual("Singapore", weatherFlowSut.showDetailTitle)
    }
}
