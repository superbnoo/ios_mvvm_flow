//
//  WeatherListViewController.swift
//  Weather
//
//  Created by An Tran on 03/12/2022.
//

import UIKit

class WeatherListViewController: UIViewController {
    
    let url = URL(string: "https://my-json-server.typicode.com/superbnoo/demo/weathers")
    
    private var viewModel: WeatherListViewModel!
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    static func create(with viewModel: WeatherListViewModel) -> WeatherListViewController {
        let view = WeatherListViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
        viewModel.loadWeathers(url: url)
    }
    
    private func setupViews() {
        title = "Weather List"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
    }
    
    private func bind(to viewModel: WeatherListViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
    }
    
    private func updateItems() {
        tableView.reloadData()
    }
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let weather = viewModel.items.value[indexPath.row]
        cell.textLabel?.text = weather.title
        cell.detailTextLabel?.text = weather.detailedWeather
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
}

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        viewModel.didSelectItem(at: indexPath.row)
    }
}
