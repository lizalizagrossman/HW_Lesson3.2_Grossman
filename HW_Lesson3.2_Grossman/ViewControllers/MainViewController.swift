//
//  MainViewController.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 20/03/2023.
//
enum Link: String {
    case regionUrl = "https://api.ebird.org/v2/data/obs/IL/recent"
}

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBirds()
    }
}
//MARK: - Networking
extension MainViewController {
    private func fetchBirds() {
        guard let url = URL(string: Link.regionUrl.rawValue) else { return }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["X-eBirdApiToken": "cqcv7c11crts"]
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let birds = try decoder.decode([Bird].self, from: data)
                print(birds)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
