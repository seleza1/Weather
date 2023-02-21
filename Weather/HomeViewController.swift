//
//  ViewController.swift
//  Weather
//
//  Created by user on 20.02.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var temperatureLabel: UILabel!
    
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        
        NetworkController.fetchWeather { weather in
            print(weather)
        }
    }

    private func setupUi() {
        temperatureLabel.text = viewModel.temperatureString
    }
}
