//
//  WeatherSceneDIContainer.swift
//  Weather
//
//  Created by An Tran on 03/12/2022.
//

import Foundation
import UIKit

final class WeatherSceneDIContainer: WeatherSearchFlowCoordinatorDependencies {
    
    struct Dependencies {
        let apiDataTransferService: DataTransfer
        let imageDataTransferService: DataTransfer
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Weather List
    func makeWeatherListViewController(actions: WeatherListViewModelActions) -> WeatherListViewController {
        return WeatherListViewController.create(with: makeWeatherListViewModel(actions: actions))
    }
    
    func makeWeatherListViewModel(actions: WeatherListViewModelActions) -> WeatherListViewModel {
        return DefaultWeatherListViewModel(actions: actions)
    }
    
    // MARK: - Movie Details
    func makeWeatherDetailViewController(weather: WeatherListItemViewModel) -> UIViewController {
        
        return WeatherDetailViewController.create(with: weather)
    }
    
    // MARK: - Flow Coordinators
    func makeWeatherSearchFlowCoordinator(navigationController: UINavigationController) -> WeatherSearchFlowCoordinator {
        return WeatherSearchFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
