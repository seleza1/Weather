//
//  ViewController.swift
//  Weather
//
//  Created by user on 20.02.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkController.fetchWeather { weather in
            print(weather)
        }
    }
}