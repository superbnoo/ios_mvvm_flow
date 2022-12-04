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

    // MARK: - Persistent Storage
//    lazy var WeatherQueriesStorage: WeatherQueriesStorage = CoreDataStorage(maxStorageLimit: 10)
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
//    func makeSearchWeatherUseCase() -> SearchWeatherUseCase {
//        return DefaultSearchWeatherUseCase(moviesRepository: makeWeatherRepository(),
//                                          moviesQueriesRepository: makeWeatherQueriesRepository())
//    }
    
//    func makeFetchWeatherRecentQueriesUseCase() -> FetchWeatherRecentQueriesUseCase {
//        return DefaultFetchWeatherRecentQueriesUseCase(moviesQueriesRepository: makeWeatherQueriesRepository())
//    }
    
    // MARK: - Data Sources
//    func makeWeatherRepository() -> WeatherRepository {
//        return DefaultWeatherRepository(dataTransferService: dependencies.apiDataTransferService)
//    }
//    func makeWeatherQueriesRepository() -> WeatherQueriesRepository {
//        return DefaultWeatherQueriesRepository(dataTransferService: dependencies.apiDataTransferService,
//                                              moviesQueriesPersistentStorage: moviesQueriesStorage)
//    }
//    func makePosterImagesRepository() -> PosterImagesRepository {
//        return DefaultPosterImagesRepository(dataTransferService: dependencies.imageDataTransferService,
//                                             imageNotFoundData: UIImage(named: "image_not_found")?.pngData())
//    }
    
    
//    func makeWeatherListViewModel() -> WeatherListViewModel {
//        return WeatherListViewModel(searchWeatherUseCase: makeSearchWeatherUseCase(),
//                                   posterImagesRepository: makePosterImagesRepository())
//    }
    
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
