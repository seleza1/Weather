//
//  ViewController.swift
//  Weather
//
//  Created by user on 20.02.2023.
//

import UIKit

class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel()

    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    @IBOutlet var minTemperatureLabel: UILabel!
    @IBOutlet var maxTemperatureLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()


        viewModel.fetchWeather { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
            }
        }
    }

    private func setupUI() {
        setupHeader()
        setupSubheader()
    }

    private func setupHeader() {
        temperatureLabel.text = viewModel.temperatureString
        nameLabel.text = viewModel.nameString
    }

    private func setupSubheader() {
        feelsLikeLabel.text = viewModel.feelsLikeTemperatureString
        minTemperatureLabel.text = viewModel.minTemperatureString
        maxTemperatureLabel.text = viewModel.maxTemperatureString
        pressureLabel.text = viewModel.pressureString
        humidityLabel.text = viewModel.humidityString
    }
}
