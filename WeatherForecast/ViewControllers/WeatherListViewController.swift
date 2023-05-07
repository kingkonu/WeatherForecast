//
//  WeatherListViewController.swift
//  WeatherForecast
//
//  Created by Alexey Kanaev on 5/7/23.
//

import UIKit

enum Link {
    case imageURL
    case weatherURL

    var url: URL {
        switch self {
        case .imageURL:
            return URL(string: "https://openweathermap.org/current")!
        case .weatherURL:
            return URL(string: "https://openweathermap.org/current")!
        }
    }
}

final class WeatherListViewController: UITableViewController {
    
    private let weatherList = Weather.getWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
        URLSession.shared.dataTask(with: Link.weatherURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(Weather.self, from: data)
                print(weather)
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

