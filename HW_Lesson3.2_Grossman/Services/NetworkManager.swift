//
//  NetworkManager.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 23/03/2023.
//

import Foundation
import Alamofire

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

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchbirds(from url: URL, completion: @escaping(Result<[Bird], AFError>) -> Void) {
        AF.request(url, headers: ["X-eBirdApiToken": "cqcv7c11crts"])
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let birds = Bird.getBirds(from: value)
                    completion(.success(birds))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        
    }
    
    
}



