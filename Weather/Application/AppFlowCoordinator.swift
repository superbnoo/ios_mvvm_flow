//
//  AppFlowCoordinator.swift
//  Weather
//
//  Created by An Tran on 04/12/2022.
//

import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let weatherSceneDIContainer = appDIContainer.makeWeatherSceneDIContainer()
        let flow = weatherSceneDIContainer.makeWeatherSearchFlowCoordinator(
            navigationController: navigationController
        )
        flow.start()
    }
}
