//
//  WeatherFlowCoordinatorStub.swift
//  WeatherTests
//
//  Created by An Tran on 06/12/2022.
//

import UIKit

final class WeatherFlowCoordinatorStub: WeatherFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: WeatherSearchFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         dependencies: WeatherSearchFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    var started = false
    var showDetailTitle = ""
    
    func start() {
        started = true
    }

    func showWeatherDetails(weather: WeatherListItemViewModel) {
        showDetailTitle = weather.title
    }
}
