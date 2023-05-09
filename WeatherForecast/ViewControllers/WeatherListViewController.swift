//
//  WeatherListViewController.swift
//  WeatherForecast
//
//  Created by Alexey Kanaev on 5/7/23.
//

import UIKit

final class WeatherListViewController: UITableViewController {
    
    private let weatherList = Weather.getWeather()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeather()
    }
}

//MARK: - UITableViewDataSource
extension WeatherListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let weather = weatherList[indexPath.row]
        content.text = weather.main
        content.secondaryText = weather.description
        content.image = UIImage(named: "cloud.sun.bolt")
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - Networking
extension WeatherListViewController {
    private func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=c774940a30af6126864b74ef99b7f447") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(WeatherInfo.self, from: data)
                print(weather)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

