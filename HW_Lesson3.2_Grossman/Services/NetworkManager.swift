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
}

extension Link: CustomStringConvertible {
  var description: String {
    rawValue.capitalized
  }
}

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(_type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["X-eBirdApiToken": "cqcv7c11crts"]
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let dataModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()

    }
    
    
}



