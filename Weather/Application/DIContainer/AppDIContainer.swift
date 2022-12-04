//
//  AppDIContainer.swift
//  Weather
//
//  Created by An Tran on 03/12/2022.
//

import Foundation
import  UIKit

final class AppDIContainer {
    
    lazy var appConfigurations = AppConfigurations()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransfer = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfigurations.apiBaseURL)!,
                                          queryParameters: ["api_key": appConfigurations.apiKey])
        
        let apiDataNetwork = DefaultNetworkService(session: URLSession.shared,
                                                   config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    lazy var imageDataTransferService: DataTransfer = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfigurations.imagesBaseURL)!)
        let carrierLogosDataNetwork = DefaultNetworkService(session: URLSession.shared,
                                                            config: config)
        return DefaultDataTransferService(with: carrierLogosDataNetwork)
    }()
    
    // DIContainers of scenes
    func makeWeatherSceneDIContainer() -> WeatherSceneDIContainer {
        let dependencies = WeatherSceneDIContainer.Dependencies(
            apiDataTransferService: apiDataTransferService,
            imageDataTransferService: imageDataTransferService
        )
        return WeatherSceneDIContainer(dependencies: dependencies)
    }
}
