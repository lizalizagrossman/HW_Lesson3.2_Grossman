//
//  NetworkManager.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 23/03/2023.
//

import Foundation

enum Link : String, CaseIterable {
    case israel
    case russia
    case belarus
    case kazakhstan
    case armenia
    
    var regionUrl: URL {
        switch self {
        case .israel:
            return URL(string:"https://api.ebird.org/v2/data/obs/IL/recent")!
        case .russia:
            return URL(string:"https://api.ebird.org/v2/data/obs/RU/recent")!
        case .belarus:
            return URL(string:"https://api.ebird.org/v2/data/obs/BY/recent")!
        case .kazakhstan:
            return URL(string:"https://api.ebird.org/v2/data/obs/KZ/recent")!
        case .armenia:
            return URL(string:"https://api.ebird.org/v2/data/obs/AM/recent")!
        }
    }
    
    var countryName: String {
        switch self {
        case .israel:
            return "Israel"
        case .russia:
            return "Russia"
        case .belarus:
            return "Belarus"
        case .kazakhstan:
            return "Kazakhstan"
        case .armenia:
            return "Armenia"
        }
    }
}

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchBirds(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {

    }
    
    
}

//MARK: - Networking
extension MainViewController {
    private func fetchBirds() {
        var request = URLRequest(url: Link.israel.regionUrl)
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

