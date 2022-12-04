//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by An Tran on 04/12/2022.
//
import UIKit

class WeatherDetailViewController: UIViewController {
    private var viewModel: WeatherListItemViewModel!
    
    let stackView = UIStackView()
    let cityLabel = makeLabel(withTitle: "", fontSize: 28)
    let temperatureLabel = makeLabel(withTitle: "", fontSize: 16)
    let weatherLabel = makeLabel(withTitle: "", fontSize: 22)
    
    static func create(with viewModel: WeatherListItemViewModel) -> WeatherDetailViewController {
        let view = WeatherDetailViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "City"
        cityLabel.text = viewModel.title
        temperatureLabel.text = viewModel.temperature
        weatherLabel.text = viewModel.weather
        
        // extra setup
        style()
        layout()
    }
}

extension WeatherDetailViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(weatherLabel)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cityLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: cityLabel.trailingAnchor, multiplier: 2),
            temperatureLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: temperatureLabel.trailingAnchor, multiplier: 2),
            weatherLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: weatherLabel.trailingAnchor, multiplier: 2),
        ])
    }
}
