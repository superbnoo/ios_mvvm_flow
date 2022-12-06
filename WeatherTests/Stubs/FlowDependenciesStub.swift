//
//  FlowDependenciesStub.swift
//  WeatherTests
//
//  Created by An Tran on 06/12/2022.
//

import UIKit

final class FlowDependenciesStub: WeatherSearchFlowCoordinatorDependencies {
    func makeWeatherListViewController(actions: WeatherListViewModelActions) -> UIViewController {
        return UIViewController()
    }
    
    func makeWeatherDetailViewController(weather: WeatherListItemViewModel) -> UIViewController {
        return UIViewController()
    }
}
