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
        cell.contentConfiguration = content
        return cell
    }
}
