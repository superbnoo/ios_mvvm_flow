//
//  WeatherSearchFlowCoordinator.swift
//  Weather
//
//  Created by An Tran on 04/12/2022.
//

import UIKit

protocol WeatherSearchFlowCoordinatorDependencies  {
    func makeWeatherListViewController(actions: WeatherListViewModelActions) -> WeatherListViewController
    func makeWeatherDetailViewController(weather: WeatherListItemViewModel) -> UIViewController
}

protocol WeatherFlowCoordinator {
    func start()
    func showWeatherDetails(weather: WeatherListItemViewModel)
}

final class WeatherSearchFlowCoordinator: WeatherFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: WeatherSearchFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         dependencies: WeatherSearchFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        // Note: here we keep strong reference with actions, this way this flow do not need to be strong referenced
        let actions = WeatherListViewModelActions(
            showWeatherDetails: showWeatherDetails
        )
        let vc = dependencies.makeWeatherListViewController(actions: actions)

        navigationController?.pushViewController(vc, animated: false)
    }

    func showWeatherDetails(weather: WeatherListItemViewModel) {
        let vc = dependencies.makeWeatherDetailViewController(weather: weather)
        navigationController?.pushViewController(vc, animated: true)
    }
}
