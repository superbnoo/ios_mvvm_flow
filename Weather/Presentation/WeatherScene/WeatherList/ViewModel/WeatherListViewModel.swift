//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by An Tran on 04/12/2022.
//

import Foundation
import Combine

struct WeatherListViewModelActions {
    let showWeatherDetails: (WeatherListItemViewModel) -> Void
}

protocol WeatherListViewModelInput {
    func loadWeathers(url: URL?)
    func didSelectItem(at index: Int)
}

protocol WeatherListViewModelOutput {
    var items: Observable<[WeatherListItemViewModel]> { get }
}

protocol WeatherListViewModel: WeatherListViewModelInput, WeatherListViewModelOutput {}

final class DefaultWeatherListViewModel: WeatherListViewModel {
    
    private let actions: WeatherListViewModelActions?
    private var moviesLoadTask: Cancellable? { willSet { moviesLoadTask?.cancel() } }
    private var weatherLoadTask: AnyCancellable?

    // MARK: - OUTPUT
    let items: Observable<[WeatherListItemViewModel]> = Observable([])

    // MARK: - Init
    init(
        actions: WeatherListViewModelActions? = nil
    ) {
        self.actions = actions
    }
    
    func loadWeathers(url: URL?) {
        weatherLoadTask = fetchWeathers(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { weathers in
                self.items.value = weathers.map(WeatherListItemViewModel.init)
        })
    }
    
    private func fetchWeathers(url: URL?) -> AnyPublisher<[Weather], Never>{
        guard let url = url else {
            return Just([])
                .eraseToAnyPublisher()
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [Weather].self, decoder: JSONDecoder())
            .catch({ _ in
                Just([])
            })
            .eraseToAnyPublisher()
        return publisher
    }
    
    func didSelectItem(at index: Int) {
        actions?.showWeatherDetails(items.value[index])
    }
}
