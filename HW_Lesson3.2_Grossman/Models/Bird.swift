//
//  Bird.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 20/03/2023.
//

import Foundation

struct Bird: Decodable {
    let comName: String
    let sciName: String
    let locName: String
    let obsDt: String
    let howMany: Int?
    
    init(comName: String, sciName: String, locName: String, obsDt: String, howMany: Int?) {
        self.comName = comName
        self.sciName = sciName
        self.locName = locName
        self.obsDt = obsDt
        self.howMany = howMany
    }
    
    init(birdData: [String: Any]) {
        comName = birdData["comName"] as? String ?? ""
        sciName = birdData["sciName"] as? String ?? ""
        locName = birdData["locName"] as? String ?? ""
        obsDt = birdData["obsDt"] as? String ?? ""
        howMany = birdData["howMany"] as? Int ?? 0
    }
    
    static func getBirds(from value: Any) -> [Bird] {
        guard let birdsData = value as? [[String: Any]] else { return [] }
        return birdsData.map { Bird(birdData: $0) }
    }
}
